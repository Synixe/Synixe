#include "script_component.hpp"

params ["_unit"];

[0, {
	{
		systemChat format [" - %1", _x];
		private _val = _unit getVariable [_x, objNull];
		if !(_val isEqualTo objNull) then {
			EXT callExtension ["save_variable", [getPlayerUID _unit, _x, str _val]];
		}
	} forEach (missionNamespace getVariable [QGVAR(tracked), []]);
}, _unit] call CBA_fnc_globalExecute;
