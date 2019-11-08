#include "script_component.hpp"

// Sync owned items
private _owned = [];
{
	_owned pushBack [_x, GVAR(owned) getVariable [_x, 0]];
} forEach allVariables GVAR(owned);

[player] call FUNC(sync);
