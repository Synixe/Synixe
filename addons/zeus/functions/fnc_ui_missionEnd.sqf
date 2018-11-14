#include "script_component.hpp"

params ["_display"];

private _title = _display displayCtrl 20600;
private _subtitle = _display displayCtrl 20601;
_title ctrlSetText (missionNamespace getVariable [QGVAR(endTitle), "Mission Completed"]);
_subtitle ctrlSetText (missionNamespace getVariable [QGVAR(endSubtitle), "gg boys well played"]);
