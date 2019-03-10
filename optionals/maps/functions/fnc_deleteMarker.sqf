/*
 * Author: Brett
 * Add a marker to a map on the server
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_marker"];

[0, {
  params ["_marker", "_map"];
  private _newMarkers = [];
  private _markers = missionNamespace getVariable [MARKERS(_map), []];
  {
    if !(_x select 0 isEqualTo _marker) then {
      _newMarkers pushBack _x;
    };
  } forEach _markers;
  missionNamespace setVariable [MARKERS(_map), _newMarkers, true];
  [QGVAR(mapUpdated), [_map]] call CBA_fnc_globalEvent;
}, [_marker, ace_player call FUNC(getMap)]] call CBA_fnc_globalExecute;
