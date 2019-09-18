#include "script_component.hpp"

params ["_config", "_prefix"];

{
	private _name = configName _x;
	_name = (_name splitString "_") joinString " ";
	private _loadout = parseSimpleArray (getText _x);
	private _loadoutName = format ["%1 - %2", _prefix, _name];

	[_loadoutName, _loadout] call ace_arsenal_fnc_addDefaultLoadout;
} forEach configProperties [_config, "!(isClass _x)"];

{
	private _name = configName _x;
	private _child = _name;
	if !(_prefix isEqualTo "") then {
		_child = format ["%1 %2", _prefix, _name];
	};

	[_x, _child] call FUNC(processTree);
} forEach ("true" configClasses _config);
