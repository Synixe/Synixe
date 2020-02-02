#include "script_component.hpp"

// Save Current State
private _ace = [] call ace_common_fnc_showHud;
private _dui = diwako_dui_main_toggled_off;
private _indicators = diwako_dui_indicators_show;

private _staminaBar = uiNamespace getVariable ["ace_advanced_fatigue_staminaBarContainer", controlNull];
private _stamina = ctrlShown _staminaBar;
private _nametags = ace_nametags_showplayernames;

// Hide UI
["hideHud", [false, false, false, false, false, false, false, false]] call ace_common_fnc_showHud;
diwako_dui_main_toggled_off = true;
diwako_dui_indicators_show = false;
_staminaBar ctrlShow false;
ace_nametags_show_playernames = 0;

[{
  params ["_ace", "_radar", "_indicators", "_stamina", "_staminaBar", "_nametags"];
  [_ace, _radar, _indicators, _stamina, _staminaBar, _nametags] spawn {
    params ["_ace", "_radar", "_indicators", "_stamina", "_staminaBar", "_nametags"];
    disableUserInput true;
    sleep 0.3;
    "synixe" callExtension "screenshot";
    sleep 0.3;
    disableUserInput false;
    // Restore UI
    ["hideHud", _ace] call ace_common_fnc_showHud;
    sleep 0.2;
    diwako_dui_main_toggled_off = _radar;
    diwako_dui_indicators_show = _indicators;
    _staminaBar ctrlShow _stamina;
    ace_nametags_show_playernames = _nametags;
  };
}, [_ace, _dui, _indicators, _stamina, _staminaBar, _nametags]] call CBA_fnc_execNextFrame;
