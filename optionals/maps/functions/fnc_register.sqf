/*
 * Author: Brett
 * Registers a new map on the server and returns the class
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Map Class <STRING>
 *
 * Example:
 * call synixe_maps_fnc_register
 *
 * Public: No
 */

#include "script_component.hpp"

if (!isServer) exitWith {0};

private _maps = missionNamespace getVariable [QGVAR(maps), []];

private _newMap = count _maps + 1;
if (_newMap > 255) exitWith {""};
_newMap = _newMap call synixe_common_fnc_dec2hex;
if (count _newMap == 1) then {
  _newMap = "0" + _newMap;
};

private _map = format ["synixe_map_%1", _newMap];
_maps pushBack _map;
missionNamespace setVariable [QGVAR(maps), _maps];

private _markers = [];
{
  _markers pushBack _x;
} forEach (missionNamespace getVariable [QGVAR(briefingMarkers), []]);
missionNamespace setVariable [MARKERS(_map), _markers, true];

_map
