#include "script_component.hpp"

params ["_unit", "_uid"];

[_unit, _uid] call FUNC(db_sync);

[0, {
	params ["_unit", "_uid"];
	INFO_1("saving %1", name _unit);
	if (_unit getVariable [QGVAR(inArsenal), false]) exitWith {
		INFO_1("%1 in arsenal, skipping", name _unit);
	};
	EXT callExtension ["save_loadout", [_uid, str ([_unit] call FUNC(cleanLoadout))]];
}, [_unit, _uid] call CBA_fnc_globalExecute;
