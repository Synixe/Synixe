#include "script_component.hpp"

params ["_box"];

[_box, call FUNC(getItems)] call ace_arsenal_fnc_initBox;
