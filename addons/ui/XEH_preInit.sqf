#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

[
  QGVAR(ShowRadar),
  "CHECKBOX",
  "Use Squad Radar",
  "Synixe HUD",
  true
] call CBA_settings_fnc_init;

[
  QGVAR(ShowIndicators),
  "CHECKBOX",
  "Use Indicators",
  "Synixe HUD",
  true
] call CBA_settings_fnc_init;
