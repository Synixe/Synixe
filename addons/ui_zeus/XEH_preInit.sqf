#include "script_component.hpp"
ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GOM_fnc_replaceInString = {
  params ["_string","_find","_replaceWith"];
  _pos = (_string find _find);
  if (_pos isEqualTo -1) exitWith {_string};
  [[(_string select [0,_pos]),_replaceWith,_string select [_pos + count _find,count _string]] joinString "",_find,_replaceWith] call GOM_fnc_replaceInString;
};

[
  QGVAR(visibilityIndicator),
  "CHECKBOX",
  "STR_3DEN_Waypoint_AttributeCategory_Visibility", // Visiblity
  "Synixe Zeus",
  true
] call CBA_Settings_fnc_init;

[
  QGVAR(displayPlayerInfo),
  "CHECKBOX",
  "Display Player Info",
  "Synixe Zeus",
  true
] call CBA_Settings_fnc_init;

[
  QGVAR(displayName),
  "CHECKBOX",
  "str_a3_rscattributename_title", // Name
  ["Synixe Zeus","Player Info"],
  false
] call CBA_Settings_fnc_init;

[
  QGVAR(displayRole),
  "CHECKBOX",
  "str_3den_object_attribute_description_displayname", // Role Description
  ["Synixe Zeus","Player Info"],
  true
] call CBA_Settings_fnc_init;

[
  QGVAR(displayFPS),
  "CHECKBOX",
  "FPS",
  ["Synixe Zeus","Player Info"],
  false
] call CBA_Settings_fnc_init;

[
  QGVAR(displayTeam),
  "CHECKBOX",
  "Display Team",
  ["Synixe Zeus","Player Info"],
  true
] call CBA_Settings_fnc_init;

[
  QGVAR(displayRadios),
  "CHECKBOX",
  "str_a3_cfgweapons_itemradio0", // Radio
  ["Synixe Zeus","Player Info"],
  false
] call CBA_Settings_fnc_init;

if (isClass(configFile >> "CfgPatches" >> "ace_medical")) then {
  [
    QGVAR(displayACEMedical),
    "CHECKBOX",
    "Display ACE Medical",
    ["Synixe Zeus","Player Info"],
    true
  ] call CBA_Settings_fnc_init;
  [
    QGVAR(displayACEMedicalLives),
    "CHECKBOX",
    "Display ACE Medical Lives",
    ["Synixe Zeus","Player Info"],
    false
  ] call CBA_Settings_fnc_init;
};

ADDON = true;
