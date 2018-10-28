#include "script_component.hpp"
/*
 * Author: SilentSpike, mharis001, SynixeBrett
 * Initalizes the "Respawn Player" Zeus module display.
 *
 * Arguments:
 * 0: repsawnPlayers controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_control"];

//Generic Init:
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK

_control ctrlRemoveAllEventHandlers "setFocus";

//Specific on-load stuff:
private _listbox = _display displayCtrl 16189;
{
  if (_x getVariable [QGVAR(dead), false]) then {
    _listbox lbSetData [_listbox lbAdd (name _x), getPlayerUID _x];
  };
} forEach ([] call CBA_fnc_players);

_listbox lbSetCurSel 0;

private _fnc_onKeyUp = {
  params ["_display"];

  private _listbox = _display displayCtrl 16189;
  private _edit = _display displayCtrl 16190;
  private _text = toLower ctrlText _edit;

  lbClear _listbox;

  {
    if (_x getVariable [QGVAR(dead), false]) then {
      if ([toLower name _x, _text] call CBA_fnc_find > -1) then {
        _listbox lbSetData [_listbox lbAdd (name _x), getPlayerUID _x];
      };
    };
  } forEach ([] call CBA_fnc_players);

  // Alert user to zero search matches
  if (lbSize _listbox == 0) then {
    _edit ctrlSetTooltip (localize LSTRING(ModuleRespawnPlayer_noneFound));
    _edit ctrlSetTextColor [1, 0, 0, 1];
  } else {
    _edit ctrlSetTooltip "";
    _edit ctrlSetTextColor [1, 1, 1, 1];
  };
};

private _fnc_onUnload = {
  params ["_display"];

  private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objnull];
  if (isNull _logic) exitWith {};
};

private _fnc_onConfirm = {
  params [["_ctrlButtonOK", controlNull, [controlNull]]];

  private _display = ctrlparent _ctrlButtonOK;
  if (isNull _display) exitWith {};

  private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objnull];
  if (isNull _logic) exitWith {};

  private _lb = _display displayCtrl 16189;

  private _uid = _lb lbData (lbCurSel _lb);

  [_logic, _uid] call FUNC(moduleRespawnPlayer);
};

_display displayAddEventHandler ["KeyUp", _fnc_onKeyUp];
_display displayAddEventHandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", _fnc_onConfirm];
