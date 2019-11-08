#include "script_component.hpp"

params ["_items"];

private _cost = 0;

{
	private _quantity = _items getVariable [_x, 0];
	private _owned = [_x] call FUNC(getOwned);
	private _price = [_x] call FUNC(getPrice);
	private _need = _quantity - _owned;
	if (_need > 0) then {
		_cost = _cost + (_price * _need);
	};
} forEach allVariables _items;

_cost
