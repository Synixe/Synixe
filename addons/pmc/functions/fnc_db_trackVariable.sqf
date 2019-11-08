#include "script_component.hpp"

params ["_variable"];

private _tracked = missionNamespace getVariable [QGVAR(tracked), []];
_tracked pushBack _variable;
missionNamespace setVariable [QGVAR(tracked), _tracked, true];
