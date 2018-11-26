#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

[
  QGVAR(properPlacement),
  "CHECKBOX",
  "Proper Placement",
  "Synixe Zeus",
  true
] call CBA_Settings_fnc_init;

ADDON = true;
