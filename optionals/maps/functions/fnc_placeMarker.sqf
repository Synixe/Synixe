#include "script_component.hpp"

disableserialization;
params ["_display", "_closeNum"];

if (time == 0) exitWith { [_display, _closeNum] call ace_markers_fnc_placeMarker; };

if (_closeNum == 1) then {
  if !(ace_player getVariable [QGVAR(isPeeking), false]) then {
    if (ace_player call FUNC(hasUniqueMap)) then {
      [{
        private _marker = allMapMarkers select (count allMapMarkers - 1);
        private _markerClassname = missionNamespace getVariable ["ace_markers_currentMarkerConfigName", ""];
        private _colorClassname = missionNamespace getVariable ["ace_markers_currentMarkerColorConfigName", ""];
        private _pos = missionNamespace getVariable ["ace_markers_currentMarkerPosition", []];
        private _dir = missionNamespace getVariable ["ace_markers_currentMarkerAngle", 0];

        private _config = configfile >> "CfgMarkers" >> _markerClassname;

        if (!isClass _config) then {
          _config = configFile >> "CfgMarkers" >> "MilDot";
        };
        _marker setMarkerTypeLocal configName _config;
        _config = configfile >> "CfgMarkerColors" >> _colorClassname;
        if (!isClass _config) then {
          _config = configFile >> "CfgMarkerColors" >> "Default";
        };
        _marker setMarkerColorLocal configName _config;
        _marker setMarkerPosLocal _pos;
        _marker setMarkerDirLocal _dir;

        private _data = _marker call FUNC(getMarkerData);

        [_data] call FUNC(createMarker);

        deleteMarker _marker;
        createMarkerLocal [_marker, _data select 1];
        [_data] call FUNC(setMarkerData);

      }] call CBA_fnc_execNextFrame;
    };
  };
};
