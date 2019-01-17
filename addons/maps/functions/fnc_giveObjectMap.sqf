/*
 * Author: Brett
 * Used to give a map to a non-unit (Players or AI) object
 *
 * Arguments:
 * 0: _object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _laptop call synixe_maps_fnc_giveObjectMap
 *
 * Public: Yes
 */

params [["_object", objNull, [objNull]]];

if (_object isEqualTo objNull) exitWith {false};

[0, {
  _this setVariable [QGVAR(map), call FUNC(register), true];
}, _object] call CBA_fnc_globalExecute;
