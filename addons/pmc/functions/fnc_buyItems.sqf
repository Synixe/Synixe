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
		GVAR(owned) setVariable [_x, _owned + _need];
		private _balance = player getVariable [QGVAR(balance), 2000];
		_balance = _balance - (_price * _need);
		player setVariable [QGVAR(balance), _balance, true];
	};
} forEach allVariables _items;

[player, getPlayerUID player] call FUNC(db_sync);

_cost
