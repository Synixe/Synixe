#include "script_component.hpp"


// Save Current State
private _ace = [] call ace_common_fnc_showHud;
private _dui = diwako_dui_main_toggled_off;

// Hide UI
["hideHud", [false, false, false, false, false, false, false, false]] call ace_common_fnc_showHud;
diwako_dui_main_toggled_off = true;

[{
  params ["_ace", "_radar", "_indicators"];
  [_ace, _radar, _indicators] spawn {
    params ["_ace", "_radar", "_indicators"];
    sleep 0.1;
    "synixe" callExtension "screenshot";
    sleep 0.1;
    // Restore UI
    ["hideHud", _ace] call ace_common_fnc_showHud;
    diwako_dui_main_toggled_off = _dui;
  };
}, [_ace, _radar, _indicators]] call CBA_fnc_execNextFrame;
