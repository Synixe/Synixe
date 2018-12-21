/*
 * Author: Brett
 * Returns a group by name
 *
 * Arguments:
 * 0: _side <SIDE>
 * 1: _group <STRING>
 *
 * Return Value:
 * group <GROUP>
 *
 * Example:
 * [west, "Alpha"] call synixe_fireteams_fnc_groupExists
 *
 * Public: Yes
 */

params [
  ["_side", west],
  ["_group", ""]
];

private _ret_group = grpNull;

{
  if (toLower (groupId _x) == _group) exitWith { _ret_group = _x; };
} forEach allGroups select { side _x isEqualTo _side};

_ret_group
