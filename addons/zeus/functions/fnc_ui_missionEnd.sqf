#include "script_component.hpp"

["onLoad", _this, "RscDisplayDebriefing", 'GUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay');

params ["_display"];

private _title = _display displayCtrl 20600;
private _subtitle = _display displayCtrl 20601;
_subtitle ctrlSetFade 0;
_subtitle ctrlShow true;
_subtitle ctrlCommit 0;
_title ctrlSetText (missionNamespace getVariable [QGVAR(endTitle), "Mission Completed"]);
_subtitle ctrlSetText (missionNamespace getVariable [QGVAR(endSubtitle), "gg boys well played"]);
