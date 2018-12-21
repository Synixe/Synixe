#include "script_component.hpp"
/*
 * Author: Brett
 * Some code from CBA authored by commy2
 * Changes a CBA keybind
 *
 * Arguments:
 * 0: Action Name
 * 1: New Key Bind
 *
 * Example:
 * ["acre2$defaultpttkey", [[58, [false, false, false]]]] call synixe_common_fnc_setCBAKey
 *
 * Public: No
 */

params ["_action", "_keybinds"];

private _registry = profileNamespace getVariable ["CBA_keybinding_registry_v3", nil];

(CBA_keybinding_actions getVariable _action) params ["", "", "_oldKeybinds", "", "_downCode", "_upCode", "_holdKey", "_holdDelay"];
(CBA_keybinding_actions getVariable _action) set [2, _keybinds];

{
  private _keybind = _x;

  if !(_downCode isEqualTo {}) then {
    [_keybind select 0, _keybind select 1, _downCode, "keyDown", format ["%1_down_%2", _action, _forEachIndex], _holdKey, _holdDelay] call CBA_fnc_addKeyHandler;
  };

  if !(_upCode isEqualTo {}) then {
    [_keybind select 0, _keybind select 1, _upCode, "keyUp", format ["%1_up_%2", _action, _forEachIndex]] call CBA_fnc_addKeyHandler;
  };
} forEach _keybinds;

for "_index" from (count _keybinds) to (count _oldKeybinds - 1) do {
  [format ["%1_down_%2", _action, _index], "keydown"] call CBA_fnc_removeKeyHandler;
  [format ["%1_up_%2", _action, _index], "keyup"] call CBA_fnc_removeKeyHandler;
};

// save in profile
[_registry, _action, _keybinds] call CBA_fnc_hashSet;
