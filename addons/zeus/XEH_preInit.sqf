#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

[
  QGVAR(environmentSounds),
  "CHECKBOX",
  "Environment Sounds",
  "Synixe Zeus",
  true,
  0,
  {
    params ["_value"];
    enableEnvironment [true, _value];
  }
] call CBA_Settings_fnc_init;

GVAR(curators) = [];

ADDON = true;
