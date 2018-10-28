/*
 * Author: Brett
 * Return the path to an object's icon
 *
 * Arguments:
 * 0: _object <OBJECT>
 *
 * Return Value:
 * _icon <STRING>
 *
 * Example:
 * [player] call synixe_ui_fnc_getIcon
 *
 * Public: Yes
 */

params [
  ["_target", objNull]
];

private _icon = getText(configFile >> "CfgVehicles" >> typeOf _target >> "icon");

if !(_icon select [0, 1] isEqualTo "\") then {
  _icon = "\a3\ui_f\data\map\vehicleicons\" + _icon + "_ca.paa";
};

_icon
