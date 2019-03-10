/*
 * Author: Brett
 * Converts a decimal number to hexadecimal
 *
 * Arguments:
 * 0: number <NUMBER>
 *
 * Return Value:
 * hexadecimal <STRING>
 *
 * Example:
 * 11 call synixe_common_fnc_dec2hex
 * "A"
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_dec"];
private _x = (_dec % 16);
private _digits = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];
private _rest = floor (_dec / 16);
if (_rest == 0) exitWith { _digits select _x };
(_rest call FUNC(dec2hex)) + (_digits select _x)