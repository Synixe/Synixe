#include "script_component.hpp"

params ["_control"];

// Generic init
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; // IDC_OK

_control ctrlRemoveAllEventHandlers "SetFocus";

(_display displayCtrl 92855) ctrlSetText "Mission Completed";
(_display displayCtrl 92856) ctrlSetText "gg well done";

private _fnc_onUnload = {
  private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objnull];
  if (isNull _logic) exitWith {};

  deleteVehicle _logic;
};

private _fnc_onConfirm = {
  params [["_ctrlButtonOK", controlNull, [controlNull]]];

  private _display = ctrlParent _ctrlButtonOK;
  if (isNull _display) exitWith {};

  private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objnull];
  if (isNull _logic) exitWith {};

  private _title = ctrlText (_display displayCtrl 92855);
  private _subtitle = ctrlText (_display displayCtrl 92856);

  [_logic, _title, _subtitle, false] call FUNC(moduleEndScenario);
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
