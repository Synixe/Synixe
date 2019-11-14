#include "script_component.hpp"

["Synixe PMC", "Payment", {
    params ["","_object"];
    [
        "Payment",
        [["SLIDER","Payment Amount",[500,2000,1000,0],0]],
        {
            params ["_values", "_args"];
            _values params ["_amount"];
            _args params ["_object"];
            private _current = _object getVariable [QGVAR(balance), 0];
            _object setVariable [QGVAR(balance), _current + _amount, true];
        },{},[_object]
    ] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["Synixe PMC", "Fine", {
    params ["","_object"];
    [
        "Fine",
        [["SLIDER","Fine Amount",[10,1000,200,0],0]],
        {
            params ["_values", "_args"];
            _values params ["_amount"];
            _args params ["_object"];
            private _current = _object getVariable [QGVAR(balance), 0];
            _object setVariable [QGVAR(balance), _current - _amount, true];
        },{},[_object]
    ] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;
