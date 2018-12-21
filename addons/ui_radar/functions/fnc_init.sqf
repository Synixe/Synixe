#include "script_component.hpp"

//Wait for the loading screen (Vanilla and Synixe) to be closed
0 spawn {
  waitUntil { !isNull(findDisplay 46) };

  // otherwise create canvas
  QGVAR(canvas) cutRsc ["RscTitleDisplayEmpty", "PLAIN", 0, false];
  private _display = uiNamespace getVariable "RscTitleDisplayEmpty";
  uiNamespace setVariable [QGVAR(canvas), _display];

  // kill duplicate vignette
  private _vignette = _display displayCtrl 1202;
  _vignette ctrlShow false;

  // radar control
  private _control = _display ctrlCreate ["RscPicture", -1];
  _display setVariable [QGVAR(radar), _control];

  private _width = GVAR(RadarSize) * (((safezoneW / safezoneH) min 1.2) / 40);
  private _height = GVAR(RadarSize) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
  private _left = (0.5 - _width / 2);
  private _top = (safezoneY + safezoneH - 1.2 * _height);

  _control ctrlSetPosition [_left, _top, _width, _height];
  _control ctrlCommit 0;

  // squad member markers
  private _markers = [];
  _control setVariable [QGVAR(markers), _markers];

  for "_i" from 1 to 100 do {
    private _marker = _display ctrlCreate ["RscPicture", -1];
    _marker ctrlSetText "\a3\ui_f\data\IGUI\Cfg\SquadRadar\SquadRadarOtherGroupUnit_ca.paa";
    _marker ctrlShow false;
    _markers pushBack _marker;
  };

  _control setVariable [QGVAR(radarMakers), _markers];

  // draw script
  private _script = _display ctrlCreate ["RscMapControl", -1];

  _script ctrlSetPosition [0, 0, 0, 0];
  _script ctrlCommit 0;

  _script ctrlAddEventHandler ["Draw", {
    params ["_script"];
    _script call FUNC(tick);
  }];
};
