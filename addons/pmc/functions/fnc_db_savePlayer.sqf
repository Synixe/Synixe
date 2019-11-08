#include "script_component.hpp"

params ["_unit"];

[0, {
	params ["_unit"];
	if !(_unit getVariable [QGVAR(inArsenal), false]) exitWith {};
	systemChat format ["saving %1", name _unit];
	EXT callExtension ["save_loadout", [getPlayerUID _unit, str ([_unit] call FUNC(cleanLoadout))]];
	[_unit] call FUNC(db_sync);
}, _unit] call CBA_fnc_globalExecute;
