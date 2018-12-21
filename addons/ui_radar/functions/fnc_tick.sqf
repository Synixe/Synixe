#include "script_component.hpp"

params ["_script"];
private _display = ctrlParent _script;
private _control = _display getVariable QGVAR(radar);
private _markers = _control getVariable QGVAR(markers);

if (!EGVAR(ui,ShowRadar) || { call EFUNC(common,inZeus) } ) then {
  _control ctrlShow false;
  {
    _x ctrlShow false;
  } forEach _markers;
} else {
  private _view = AGLToASL positionCameraToWorld [0, 0, 0] vectorFromTo AGLToASL positionCameraToWorld [0, 0, 1];
  private _viewHorizontal = vectorNormalized (_view vectorCrossProduct [0, 0, 1]);
  private _eyeDir = acos (_viewHorizontal select 0);
  if (_viewHorizontal select 1 > 0) then {
    _eyeDir = 360 - _eyeDir;
  };

  [_control, _eyeDir] call FUNC(draw);

  // update positions of squad members
  ctrlPosition _control params ["_left", "_top", "_width", "_height"];
  private _center = [_left + _width / 2, _top + _height / 2];

  private _nearUnits = nearestObjects [ace_player, [], RADAR_RADIUS];

  {
    private _target = _nearUnits param [_forEachIndex, objNull];
    if (isNull _target) then {
      _x ctrlShow false;
    } else {
      if (_target getVariable [QGVAR(tracking), false] || {side _target == side ace_player}) then {
        _target setVariable [QGVAR(tracking), true];
        private _alpha = 1;
        private _pos = getPos _target;
        private _lookingDir = getDir _target;
        private _vehicle = vehicle _target;
        if (count lineIntersectsSurfaces [eyePos ace_player, eyePos _target, ace_player, _target] == 0) then {
          _target setVariable [QGVAR(hasSeen), true];
          _target setVariable [QGVAR(lastSeen), time];
          _target setVariable [QGVAR(lastPosition), getPos _target];
          _target setVariable [QGVAR(lastDirection), getDir _target];
          _target setVariable [QGVAR(lastVehicle), vehicle _target];
        } else {
          if (_target getVariable [QGVAR(hasSeen), false]) then {
            _pos = _target getVariable [QGVAR(lastPosition), [0,0,0]];
            _lookingDir = _target getVariable [QGVAR(lastDirection), 0];
            _vehicle = _target getVariable [QGVAR(lastVehicle), _target];
            private _lastSeen = _target getVariable [QGVAR(lastSeen), time];
            if (time isEqualTo _lastSeen) then {
              _alpha = 1;
            } else {
              _alpha = 1 / (time - _lastSeen);
            };
          } else {
            _pos = [-100, -100, -100];
          };
        };
        private _dir = ace_player getRelDir _pos;
        private _dist = (ace_player distance2D _pos) / (RADAR_RADIUS * 2);

        _x ctrlSetText (_vehicle call EFUNC(ui,getIcon));

        _x ctrlSetAngle [_lookingDir - _eyeDir, 0.5, 0.5];
        _x ctrlSetScale GVAR(radarIconSize);
        _x ctrlSetTextColor ([_target, _alpha] call EFUNC(ui,getColor));
        _x ctrlSetPosition [
          (_center select 0) +  _width * (sin _dir * _dist) -  _width / (8 / GVAR(RadarIconSize)),
          (_center select 1) - _height * (cos _dir * _dist) - _height / (8 / GVAR(RadarIconSize)),
          _width / 4,
          _height / 4
        ];
        _x ctrlCommit 0;
        _x ctrlShow true;
      } else {
        _x ctrlShow false;
      };
    };
  } forEach _markers;
};
