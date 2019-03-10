#include "script_component.hpp"


// Save Current State
private _ace = [] call ace_common_fnc_showHud;

// Hide UI
["hideHud", [false, false, false, false, false, false, false, false]] call ace_common_fnc_showHud;

[{
  params ["_ace", "_radar", "_indicators"];
  [_ace, _radar, _indicators] spawn {
    params ["_ace", "_radar", "_indicators"];
    sleep 0.1;
    "synixe" callExtension "screenshot";
    sleep 0.1;
    // Restore UI
    ["hideHud", _ace] call ace_common_fnc_showHud;
  };
}, [_ace, _radar, _indicators]] call CBA_fnc_execNextFrame;
