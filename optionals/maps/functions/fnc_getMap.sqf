/*
 * Author: Brett
 * Get the class of a unit's map
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Map Class <STRING>
 *
 * Example:
 * _player call synixe_maps_fnc_getMap
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", ace_player, [objNull]]];

private _map = "";

if (_unit isKindOf "CAManBase") then {
  if (_unit call FUNC(hasUniqueMap)) then { _map = (assignedItems _unit) select 0 };
} else {
  _map = _unit getVariable [QGVAR(map), ""];
};

_map
