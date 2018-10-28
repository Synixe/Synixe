#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

if (PATCH("synixe_ui_radar")) then {
  [
    QGVAR(ShowRadar),
    "CHECKBOX",
    "Use Squad Radar",
    "Synixe HUD",
    true
  ] call CBA_settings_fnc_init;
};

if (PATCH("synixe_ui_indicators")) then {
  [
    QGVAR(ShowIndicators),
    "CHECKBOX",
    "Use Indicators",
    "Synixe HUD",
    true
  ] call CBA_settings_fnc_init;
};
