#include "script_component.hpp"

params ["_size"];

private _display = uiNamespace getVariable [QGVAR(canvas), displayNull];

if !(isNull _display) then {
  private _control = _display getVariable QGVAR(radar);

  private _width = _size * (((safezoneW / safezoneH) min 1.2) / 40);
  private _height = _size * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
  private _left = (0.5 - _width/2);
  private _top = (safezoneY + safezoneH - 1.2 * _height);

  _control ctrlSetPosition [_left, _top, _width, _height];
  _control ctrlCommit 0;
};
