/*
 * Author: Brett
 * Copy markers from one map to another
 *
 * Arguments:
 * 0: Source <MAP>
 * 1: Target <MAP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_sourceMap, _targetMap] call synixe_maps_fnc_copy
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_source", ["_target", ace_player call FUNC(getMap)]];

[0, {
  params ["_source", "_target"];
  private _sourceMarkers = missionNamespace getVariable [MARKERS(_source), []];
  private _targetMarkers = missionNamespace getVariable [MARKERS(_target), []];
  private _transfer = _sourceMarkers - (missionNamespace getVariable [QGVAR(briefingMarkers), []]);
  _targetMarkers = _targetMarkers + _transfer;
  missionNamespace setVariable [MARKERS(_target), _targetMarkers, true];
  [QGVAR(mapUpdated), [_target]] call CBA_fnc_globalEvent;
}, [_source, _target]] call CBA_fnc_globalExecute;
