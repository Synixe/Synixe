/*
 * Author: Brett
 * Get an array with all the data for a marker
 *
 * Arguments:
 * 0: marker <STRING>
 *
 * Return Value:
 * Marker data <ARRAY>
 *
 * Example:
 * _marker call synixe_map_fnc_getMarkerData
 *
 * Public: Yes
 */

params ["_marker"];

[
  _marker,
  markerPos _marker,
  markerDir _marker,
  markerAlpha _marker,
  markerBrush _marker,
  markerColor _marker,
  markerShape _marker,
  markerSize _marker,
  markerText _marker,
  markerType _marker
]
