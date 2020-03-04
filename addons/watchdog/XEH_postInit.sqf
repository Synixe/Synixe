#include "script_component.hpp"

if (hasInterface) then {
	this addEventHandler ["HandleDamage", {
		params [
			"_unit", "_selection", "_damage",
			"_source", "_projectile", "_hitIndex",
			"_instigator", "_hitPoint"
		];
		if !(side _unit isEqualTo side _instigator) exitWith {};
		[_unit, _instigator] remoteExec [FUNC(friendlyFire), 2];
	}];
};
