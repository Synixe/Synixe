#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

[
  QGVAR(RadarSize),
  "LIST",
  "Size",
  ["Synixe HUD", "Squad Radar"],
  [[4, 6, 8], ["Small", "Medium", "Large"], 1],
  nil,
  {
    params ["_value"];
    _value call FUNC(setSize);
  }
] call CBA_settings_fnc_init;

[
  QGVAR(RadarBackground),
  "LIST",
  "Background",
  ["Synixe HUD", "Squad Radar"],
  [["Clear", "Semi", "Solid"], ["Transparent", "Semi-Transparent", "Solid"], 1]
] call CBA_Settings_fnc_init;

[
  QGVAR(RadarIconSize),
  "LIST",
  "Icon Size",
  ["Synixe HUD", "Squad Radar"],
  [[0.5, 0.6, 0.7, 0.8], ["Small", "Regular", "Large", "Huge"], 1]
] call CBA_Settings_fnc_init;

ADDON = true;
