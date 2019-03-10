/*
 * Author: Brett
 * Check if a unit has a unique map
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Has map <BOOLEAN>
 *
 * Example:
 * _unit call synixe_maps_fnc_hasUniqueMap
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", ace_player, [objNull]]];

private _ret = false;

if (_unit isKindOf "CAManBase") then {
  _ret = ((assignedItems _unit) select 0) call FUNC(isUnique)
} else {
  _ret = (_unit getVariable [QGVAR(map), ""]) call FUNC(isUnique)
};

_ret
