#include "script_component.hpp"

private _items = [];

{
	private _class = configName _x;
	
	if ([player, _x] call FUNC(canUse)) then {
		_items pushBack _class;
	};
} forEach configProperties [configFile >> "SynixeShop", "true", true];

_items
