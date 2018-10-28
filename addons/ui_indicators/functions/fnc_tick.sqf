#include "script_component.hpp"

private _alphaClamp = NIGHT_ALPHA + sunOrMoon * DAY_ALPHA;

private _units = allUnits - [ace_player];
if (_units isEqualTo []) exitWith {};

{
  private _icon_pos = ASLtoAGL(visiblePositionASL(vehicle(_x)));
  private _height_adjust = 0.2;
  if ((vehicle _x) isEqualTo _x) then {
      _height_adjust = _height_adjust + (_x selectionPosition "pelvis" select 2);
  } else {
      _height_adjust = _height_adjust + 0.7;
  };
  _icon_pos set [2, (_icon_pos select 2) + _height_adjust];

  private _distance = _icon_pos distance (vehicle player);
  private _alpha = linearConversion [RADIUS, RADIUS * 2, _distance, _alphaClamp, 0, true];

  if (count lineIntersectsSurfaces [eyePos ace_player, eyePos _x, ace_player, _x] == 0) then {
    _x setVariable [QGVAR(lastSeen), time];
    _x setVariable [QGVAR(lastPosition), _icon_pos];
  } else {
    _icon_pos = _x getVariable [QGVAR(lastPosition), [0,0,0]];
    private _lastSeen = _x getVariable [QGVAR(lastSeen), time];
    if !(time isEqualTo _lastSeen) then {
      _alpha = _alpha / (1 max (time - _lastSeen));
    };
  };

  private _color = [_x, _alpha] call EFUNC(ui,getColor);
  private _texture = "\A3\ui_f\data\igui\cfg\cursors\select_ca.paa";

  if (player distance _x < RADIUS * 2) then {
    private _vis = [(vehicle _x), "VIEW"] checkVisibility [eyePos player,  AGLToASL (_x modelToWorldVisual (_x selectionPosition "Spine3"))];
    private _alphaPre = _color select 3;

    private _fadeState = _x getVariable [GVAR(OccludeFade), 0];

    if (_fadeState > 1) then {_fadeState = 1};
    if (_fadeState < 0) then {_fadeState = 0};

    private _curAlpha = _fadeState;
    private _newAlpha = 0;
    if (_vis == 0 && _alphaPre > 0) then {
      (_curAlpha - 0.005) min _alphaPre
    } else {
      (_curAlpha + 0.005) min _alphaPre;
    };
    _x setVariable [GVAR(OccludeFade),_newAlpha];
    _color set [3,_newAlpha];
  };

  drawIcon3D [_texture, _color, _icon_pos, 1, 1, 0];
} forEach _units;
