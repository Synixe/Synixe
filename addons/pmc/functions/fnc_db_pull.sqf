#include "script_component.hpp"

// Tell server to fetch variables
[0, {
	private _variables = (EXT callExtension ["get_variables", [getPlayerUID _this]]) select 0;
	if !(_variables isEqualTo ":NOTFOUND") then {
		{
			systemChat format [" - %1 = %2", _x select 0, _x select 1];
			_this setVariable [_x select 0, _x select 1, true];
		} forEach parseSimpleArray (_variables);
		[QGVAR(synced), [], _this] call CBA_fnc_targetEvent;
	};
}, player] call CBA_fnc_globalExecute;
