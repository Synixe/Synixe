#include "script_component.hpp"

params ["_unit"];

[_unit] call FUNC(db_sync);

[0, {
	params ["_unit"];
	INFO_1("saving %1", name _unit);
	if (_unit getVariable [QGVAR(inArsenal), false]) exitWith {
		INFO_1("%1 in arsenal, skipping", name _unit);
	};
	EXT callExtension ["save_loadout", [getPlayerUID _unit, str ([_unit] call FUNC(cleanLoadout))]];
}, _unit] call CBA_fnc_globalExecute;
