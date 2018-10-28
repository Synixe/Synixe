#include "script_component.hpp"

params ["_control","_dir"];

_control ctrlShow true;
// show or hide cardinal directions if unit owns compass
if ("ItemCompass" in assignedItems ace_player) then {
  _control ctrlSetText "\z\synixe\addons\ui\images\RadarCompass" + GVAR(RadarBackground) + "_ca.paa";
  _control ctrlSetAngle [-_Dir, 0.5, 0.5];
} else {
  _control ctrlSetText "\z\synixe\addons\ui\images\Radar" + GVAR(RadarBackground) + "_ca.paa";
};
