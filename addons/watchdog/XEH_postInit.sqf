#include "script_component.hpp"

if (hasInterface) then {
	this addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
		if !(side _unit isEqualTo side _instigator) exitWith {};
		[0, {
			params ["_unit", "_instigator"];
			"synixe" callExtension ["watchdog", format ["%1 was injured by %2", name _unit, name _instigator]];
		}, [_unit, _instigator]];
	}];
};
