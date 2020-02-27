#include "script_component.hpp"

params ["_items"];

private _ret = [];

{
	private _quantity = _items getVariable [_x, 0];
	private _owned = [_x] call FUNC(getOwned);
	private _price = [_x] call FUNC(getPrice);
	private _need = _quantity - _owned;
	if (_need > 0) then {
		_ret pushBack [_x, _price, _need, _price * _need]
	};
} forEach allVariables _items;

_ret
