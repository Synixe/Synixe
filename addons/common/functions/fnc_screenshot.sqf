#include "script_component.hpp"

// Save Current State
private _ace = [] call ace_common_fnc_showHud;
private _dui = diwako_dui_main_toggled_off;
private _indicators = diwako_dui_indicators_show;

// Hide UI
["hideHud", [false, false, false, false, false, false, false, false]] call ace_common_fnc_showHud;
diwako_dui_main_toggled_off = true;
diwako_dui_indicators_show = false;

[{
  params ["_ace", "_radar", "_indicators"];
  [_ace, _radar, _indicators] spawn {
    params ["_ace", "_radar", "_indicators"];
    disableUserInput true;
    sleep 0.5;
    "synixe" callExtension "screenshot";
    sleep 0.5;
    disableUserInput false;
    // Restore UI
    ["hideHud", _ace] call ace_common_fnc_showHud;
    sleep 0.2;
    diwako_dui_main_toggled_off = _radar;
    diwako_dui_indicators_show = _indicators;
  };
}, [_ace, _dui, _indicators]] call CBA_fnc_execNextFrame;
