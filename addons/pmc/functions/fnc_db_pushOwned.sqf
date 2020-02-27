#include "script_component.hpp"

// Push owned items
private _owned = [];
{
	_owned pushBack [_x, GVAR(owned) getVariable [_x, 0]];
} forEach allVariables GVAR(owned);

player setVariable [QGVAR(owned), _owned, true];
