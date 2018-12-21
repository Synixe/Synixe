#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"
ADDON = false;
#include "XEH_PREP.hpp"

[
  "Synixe",
  QGVAR(screenshot),
  "HUD Free Screenshot",
  { call FUNC(screenshot); },
  "", [DIK_F11, [false, false, false]]
] call CBA_fnc_addKeybind;

ADDON = true;
