/*
 * Author: Brett
 * Take a map from a unit
 *
 * Arguments:
 * 0: Map <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: [Yes/No]
 */

#include "script_component.hpp"

params ["_target"];

systemChat format ["%1", _target];

private _map = _target call FUNC(getMap);
_target removeItem _map;
ace_player addItem _map;
[ace_player, "AmovPercMstpSrasWrflDnon_diary"] call ace_common_fnc_doAnimation;
