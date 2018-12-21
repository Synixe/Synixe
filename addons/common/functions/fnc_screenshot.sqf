#include "script_component.hpp"


// Save Current State
private _ace = [] call ace_common_fnc_showHud;
private _radar = EGVAR(ui,ShowRadar);
private _indicators = EGVAR(ui,ShowIndicators);

// Hide UI
["hideHud", [false, false, false, false, false, false, false, false]] call ace_common_fnc_showHud;
EGVAR(ui,ShowRadar) = false;
EGVAR(ui,ShowIndicators) = false;

[{
  params ["_ace", "_radar", "_indicators"];
  [_ace, _radar, _indicators] spawn {
    params ["_ace", "_radar", "_indicators"];
    sleep 0.1;
    "synixe" callExtension "screenshot";
    sleep 0.1;
    // Restore UI
    ["hideHud", _ace] call ace_common_fnc_showHud;
    EGVAR(ui,ShowRadar) = _radar;
    EGVAR(ui,ShowIndicators) = _indicators;
  };
}, [_ace, _radar, _indicators]] call CBA_fnc_execNextFrame;
