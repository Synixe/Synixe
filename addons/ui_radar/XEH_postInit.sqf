#include "script_component.hpp"

[{time > 0 && !(isNull player)},
  FUNC(init)
] call CBA_fnc_waitUntilAndExecute;
