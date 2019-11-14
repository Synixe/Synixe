#include "script_component.hpp"

params ["_unit", "_uid"];

call FUNC(db_syncOwned);

[0, {
	params ["_unit", "_uid"];
	{
		INFO_1(" - %1", _x);
		private _val = _unit getVariable [_x, objNull];
		if !(_val isEqualTo objNull) then {
			EXT callExtension ["save_variable", [_uid, _x, str _val]];
			INFO_3("syncing %1: %2 = %3", _uid, _x, str _val);
		}
	} forEach (missionNamespace getVariable [QGVAR(tracked), []]);
}, [_unit, _uid] call CBA_fnc_globalExecute;
