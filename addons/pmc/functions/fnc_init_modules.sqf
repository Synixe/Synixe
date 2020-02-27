#include "script_component.hpp"

["Synixe PMC", "Payment", {
    params ["","_object"];
    if (isNull _object) exitWith {};
    [
        "Payment",
        [["SLIDER","Payment Amount",[50,2000,1000,0],0]],
        {
            params ["_values", "_args"];
            _values params ["_amount"];
            _args params ["_object"];
            private _current = _object getVariable [QGVAR(balance), 0];
            _object setVariable [QGVAR(balance), _current + _amount, true];
            [_object, getPlayerUID _object] call FUNC(db_push);
        },{},[_object]
    ] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["Synixe PMC", "Fine", {
    params ["","_object"];
    if (isNull _object) exitWith {};
    [
        "Fine",
        [["SLIDER","Fine Amount",[10,1000,200,0],0]],
        {
            params ["_values", "_args"];
            _values params ["_amount"];
            _args params ["_object"];
            private _current = _object getVariable [QGVAR(balance), 0];
            _object setVariable [QGVAR(balance), _current - _amount, true];
            [_object, getPlayerUID _object] call FUNC(db_push);
        },{},[_object]
    ] call zen_dialog_fnc_create;
}] call zen_custom_modules_fnc_register;

["Synixe PMC", "Push", {
    [-1, {
        [player, getPlayerUID player] call FUNC(db_savePlayer);
	    [player, getPlayerUID player] call FUNC(db_push);
    }] call CBA_fnc_globalExecute;
}] call zen_custom_modules_fnc_register;

["Synixe PMC", "Refresh Items", {
    [-1, {
        [QGVAR(synced)] call CBA_fnc_localEvent;
    }] call CBA_fnc_globalExecute;
}] call zen_custom_modules_fnc_register;
