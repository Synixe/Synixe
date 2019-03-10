/*
 * Author: Brett
 * Updates a marker
 *
 * Arguments:
 * 0: Marker Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_marker] call synixe_maps_fnc_setMarkerData
 *
 * Public: No
 */

 #include "script_component.hpp"

params ["_marker"];

private _m = _marker select 0;

_m setMarkerDirLocal    (_marker select 2);
_m setMarkerAlphaLocal  (_marker select 3);
_m setMarkerBrushLocal  (_marker select 4);
_m setMarkerColorLocal  (_marker select 5);
_m setMarkerShapeLocal  (_marker select 6);
_m setMarkerSizeLocal   (_marker select 7);
_m setMarkerTextLocal   (_marker select 8);
_m setMarkerTypeLocal   (_marker select 9);
