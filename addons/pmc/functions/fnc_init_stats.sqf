#include "script_component.hpp"

// Price stat
[[[0,1,2,3,4,5,6,7,8,9,10,11], [0,1,2,3,4,5,6,7]], QGVAR(price), [], "Price", [false, true], [{}, {
	params ["_statsArray", "_itemCfg"];
	private _path = (str _itemCfg) splitString "/";
	[_path select ((count _path) - 1)] call FUNC(getPrice)
}, {true}]] call ACE_arsenal_fnc_addStat;

// Owned stat
[[[0,1,2,3,4,5,6,7,8,9,10,11], [0,1,2,3,4,5,6,7]], QGVAR(owned), [], "Owned", [false, true], [{}, {
	params ["_statsArray", "_itemCfg"];
	private _path = (str _itemCfg) splitString "/";
	[_path select ((count _path) - 1)] call FUNC(getOwned)
}, {true}]] call ACE_arsenal_fnc_addStat;
