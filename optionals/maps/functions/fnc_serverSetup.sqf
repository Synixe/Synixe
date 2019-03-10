#include "script_component.hpp"

private _markers = [];
{
  _markers pushBack (_x call FUNC(getMarkerData));
  deleteMarker _x;
} forEach allMapMarkers;
missionNamespace setVariable [QGVAR(briefingMarkers), _markers, true];
