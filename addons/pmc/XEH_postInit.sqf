#include "script_component.hpp"

[{
	private _id = getMissionConfigValue ["pmcEnabled", ""];
	if !(_id == "true") exitWith {};

	// Server side only
	if (isServer) then {
		EXT callExtension "setup";

		[QGVAR(balance)] call FUNC(db_trackVariable);
		[QGVAR(owned)] call FUNC(db_trackVariable);
		["ace_medical_medicClass"] call FUNC(db_trackVariable);

		// delete corpse
		addMissionEventHandler ["HandleDisconnect", {
			params ["_unit", "_id", "_uid", "_name"];
			[_unit, _uid, _name] call FUNC(db_savePlayer);
			_unit spawn {
				sleep 3;
				deleteVehicle _this;
			};
		}];

		INFO("setup complete");
	};

	// Don't run on HC
	if !(hasInterface) exitWith { player setVariable [QGVAR(ignore), true, true]; };

	if (typeOf player isEqualto "VirtualCurator_F") exitWith { player setVariable [QGVAR(ignore), true, true]; };

	systemChat "Enabling PMC Persistent System";

	player setUnitLoadout [[[],[],[],[],[],[],"","",[],["","","","","",""]], true];

	call FUNC(init_loadout);

	// [{time > 60 && !(isNull player)}, {
	// 	[{
	// 		[0, {
	// 			if !(_this getVariable [QGVAR(ignore), false]) then {
	// 				if !(_this getVariable [QGVAR(inArsenal), false]) then {
	// 					[_this, getPlayerUID _this] call FUNC(db_savePlayer);
	// 				};
	// 			};
	// 		}, player] call CBA_fnc_globalExecute;
	// 	}, 30] call CBA_fnc_addPerFrameHandler;
	// }] call CBA_fnc_waitUntilAndExecute;

	// Save the loadout every time it changes, except in the arsenal
	["loadout", {
		if (GVAR(ready) && {!(player getVariable [QGVAR(ignore), false])}) then {
			private _outArsenal = !(player getVariable [QGVAR(inArsenal), false]);
			if (time > 5 && {_outArsenal}) then {
				[player, getPlayerUID player] call FUNC(db_savePlayer);
			};
		};
	}] call CBA_fnc_addPlayerEventHandler;

	GVAR(owned) = call CBA_fnc_createNamespace;

	player setVariable [QGVAR(inArsenal), false, true];

	call FUNC(init_arsenal);
	call FUNC(init_stats);
	call FUNC(init_modules);
}, {}, 1] call CBA_fnc_waitAndExecute;
