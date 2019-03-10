/*
 * Author: Brett
 * Request a new map from the server
 *
 * Public: No
 */

#include "script_component.hpp"

[0, {
  [QGVAR(received), [call FUNC(register)], _this] call CBA_fnc_targetEvent;
}, ace_player] call CBA_fnc_globalExecute;
