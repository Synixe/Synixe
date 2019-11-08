#include "script_component.hpp"

params ["_items"];

{
	private _quantity = _items getVariable [_x, 0];
	private _owned = [_x] call FUNC(getOwned);
	GVAR(owned) setVariable [_x, _owned - _quantity];
} forEach allVariables _items;
