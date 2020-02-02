#include "script_component.hpp"

params ["_unit", "_item"];

private _role = (_item >> "role") call BIS_fnc_getCfgData;

if (isNil "_role") exitWith {true};

if (_role isEqualTo "medic" && {!([_unit] call ace_common_fnc_isMedic)}) exitWith { false };

true

