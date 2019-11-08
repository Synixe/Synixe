#include "script_component.hpp"

private _items = call CBA_fnc_createNamespace;

{
	if (IS_STRING(_x)) then {
		if (_x isEqualTo "") exitWith {};
		private _base = [_x] call FUNC(getListing);
		private _existing = _items getVariable [_base, 0];
		if !(([_base] call FUNC(getPrice)) == 0) then {
			_items setVariable [_base, _existing + 1];
		};
	};
	if (IS_ARRAY(_x)) then {
		if (count _x == 3 && {(IS_STRING(_x select 0) && {IS_NUMBER(_x select 1)} && {IS_NUMBER(_x select 2)})}) then {
			private _base = [_x select 0] call FUNC(getListing);
			private _existing = _items getVariable [_base, 0];
			if !(([_base] call FUNC(getPrice)) == 0) then {
				_items setVariable [_base, _existing + (_x select 1)];
			};
		} else {
			private _additional = _x call FUNC(listItems);
			{
				private _existing = _items getVariable [_x, 0];
				_items setVariable [_x, _existing + (_additional getVariable [_x, 0])];
			} forEach allVariables _additional;
			[_additional] call CBA_fnc_deleteNamespace;
		};
	};
} forEach _this;

_items
