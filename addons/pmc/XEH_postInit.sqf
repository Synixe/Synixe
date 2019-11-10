#include "\z\ace\addons\arsenal\defines.hpp"

#include "script_component.hpp"

[{
	private _id = getMissionConfigValue ["pmcEnabled", ""];
	if !(_id == "true") exitWith {};

	// Server side only
	if (isServer) then {
		EXT callExtension "setup";
		INFO("setup complete");

		// delete corpse
		addMissionEventHandler ["HandleDisconnect", {
			params ["_unit", "_id", "_uid", "_name"];
			deleteVehicle _unit;
		}];
	};

	// Don't run on HC
	if !(hasInterface) exitWith {};

	systemChat "Enabling PMC Persistent System";

	player setUnitLoadout [[[],[],[],[],[],[],"","",[],["","","","","",""]], true];

	[QGVAR(balance)] call FUNC(db_trackVariable);
	[QGVAR(owned)] call FUNC(db_trackVariable);

	// Tell server to fetch loadout
	[0, {
      private _loadout = (EXT callExtension ["get_loadout", [getPlayerUID _this]]) select 0;
      if !(_loadout isEqualTo ":NOTFOUND") then {
        [QGVAR(setLoadout), [call compile _loadout], _this] call CBA_fnc_targetEvent;
      };
    }, player] call CBA_fnc_globalExecute;

	[QGVAR(setLoadout), {
		_this params ["_loadout"];
		INFO_1("Setting loadout: %1", _loadout);
		player setUnitLoadout [_loadout, false];
		systemChat " - loadout";
	}] call CBA_fnc_addEventHandlerArgs;

	// Tell server to fetch variables
	[0, {
      private _variables = (EXT callExtension ["get_variables", [getPlayerUID _this]]) select 0;
      if !(_variables isEqualTo ":NOTFOUND") then {
        {
          	_this setVariable [_x select 0, _x select 1, true];
        } forEach parseSimpleArray (_variables);
		[QGVAR(synced), [], _this] call CBA_fnc_targetEvent;
      };
    }, player] call CBA_fnc_globalExecute;

	[QGVAR(synced), {
		[GVAR(owned)] call CBA_fnc_deleteNamespace;
		GVAR(owned) = call CBA_fnc_createNamespace;
		{
			systemChat format [" - %1", _x select 0];
			GVAR(owned) setVariable [_x select 0, _x select 1];
		} forEach (player getVariable [QGVAR(owned), []]);
	}] call CBA_fnc_addEventHandler;

	// Save the loadout every time it changes, except in the arsenal
	["loadout", {
		private _outArsenal = !(player getVariable [QGVAR(inArsenal), false]);
		if (time > 5 && {_outArsenal}) then {
			[player] call FUNC(db_savePlayer);
		};
	}] call CBA_fnc_addPlayerEventHandler;

	GVAR(owned) = call CBA_fnc_createNamespace;

	player setVariable [QGVAR(inArsenal), true, true];

	// Price stat
	[[[0,1,2,3,4,5,6,7,8,9,10,11], [0,1,2,3,4,5,6,7]], QGVAR(price), [], "Price", [false, true], [{}, {
		params ["_statsArray", "_itemCfg"];
		private _path = (str _itemCfg) splitString "/";
		[_path select ((count _path) - 1)] call FUNC(getPrice)
	}, {true}]] call ACE_arsenal_fnc_addStat;

	// Owned stat
	[[[0,1,2,3,4,5,6,7,8,9,10,11], [0,1,2,3,4,5,6,7]], QGVAR(owned), [], "Owned", [false, true], [{}, {
		params ["_statsArray", "_itemCfg"];
		private _path = (str _itemCfg) splitString "/";
		[_path select ((count _path) - 1)] call FUNC(getOwned)
	}, {true}]] call ACE_arsenal_fnc_addStat;

	call FUNC(arsenal);
	call FUNC(modules);
}, {}, 1] call CBA_fnc_waitAndExecute;
