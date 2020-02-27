#include "script_component.hpp"

params ["_unit", "_uid", ["_name", ""]];

[0, {
	params ["_unit", "_uid", "_name"];
	if (_name isEqualTo "") then {
		_name = name _unit;
	};
	INFO_1("saving %1", _name);
	if (_unit getVariable [QGVAR(inArsenal), false]) exitWith {
		INFO_1("%1 in arsenal, skipping", _name);
	};
	EXT callExtension ["save_loadout", [_uid, str ([_unit] call FUNC(cleanLoadout))]];
}, [_unit, _uid, _name]] call CBA_fnc_globalExecute;
