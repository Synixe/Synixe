#include "script_component.hpp"

[{
	private _id = getMissionConfigValue ["pmcEnabled", ""];
	if !(_id == "true") exitWith {};

	// Server side only
	if (isServer) then {
		EXT callExtension "setup";

		[QGVAR(balance)] call FUNC(db_trackVariable);
		[QGVAR(owned)] call FUNC(db_trackVariable);

		// delete corpse
		addMissionEventHandler ["HandleDisconnect", {
			params ["_unit", "_id", "_uid", "_name"];
			[_unit, _uid] call FUNC(db_savePlayer);
			_unit spawn {
				sleep 15;
				deleteVehicle _this;
			};
		}];

		INFO("setup complete");
	};

	// Don't run on HC
	if !(hasInterface) exitWith {};

	systemChat "Enabling PMC Persistent System";

	player setUnitLoadout [[[],[],[],[],[],[],"","",[],["","","","","",""]], true];

	call FUNC(init_loadout);

	// Save the loadout every time it changes, except in the arsenal
	// ["loadout", {
	// 	private _outArsenal = !(player getVariable [QGVAR(inArsenal), false]);
	// 	if (time > 5 && {_outArsenal}) then {
	// 		[player, getPlayerUID player] call FUNC(db_savePlayer);
	// 	};
	// }] call CBA_fnc_addPlayerEventHandler;

	GVAR(owned) = call CBA_fnc_createNamespace;

	player setVariable [QGVAR(inArsenal), true, true];

	call FUNC(init_arsenal);
	call FUNC(init_stats);
	call FUNC(init_modules);
}, {}, 1] call CBA_fnc_waitAndExecute;
