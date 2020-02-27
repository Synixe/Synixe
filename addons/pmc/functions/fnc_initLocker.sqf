#include "script_component.hpp"

params ["_box"];

[_box, []] call ace_arsenal_fnc_initBox;

GVAR(boxes) pushBack _box;
