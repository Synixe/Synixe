#include "script_component.hpp"

params ["_class"];

GVAR(owned) getVariable [[_class] call FUNC(getListing), 0]
