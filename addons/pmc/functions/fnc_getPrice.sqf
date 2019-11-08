#include "script_component.hpp"

params ["_class"];

private _cost = 0;

// Check for shop listing
private _shopClass = configFile >> "SynixeShop" >> ([_class] call FUNC(getListing));
if (isClass _shopClass) exitWith {
	getNumber (_shopClass >> "price")
};

_cost
