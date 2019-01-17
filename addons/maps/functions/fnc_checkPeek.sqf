
#include "script_component.hpp"

params ["_display"];

if (ace_player getVariable [QGVAR(isPeeking), false]) then {
  _display closeDisplay 2;
};
