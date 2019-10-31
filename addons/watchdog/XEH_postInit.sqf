#include "script_component.hpp"

if (hasInterface) then {
	this addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
		if !(side _unit isEqualTo side _instigator) exitWith {};
		[0, {
			params ["_unit", "_instigator"];
			"synixe" callExtension ["webhook", format ["%1 was shot by %2", name _unit, name _instigator]];
		}, [_unit, _instigator]];
	}];
};
