/*
 * Author: Brett
 * Returns the color of team
 *
 * Arguments:
 * 0: _team <NUMBER>
 * 1: _alpha <NUMBER> (default: 1)
 *
 * Return Value:
 * color <STRING>
 *
 * Example:
 * 2 call synixe_ui_fnc_teamColor
 * "MAIN" call synixe_ui_fnc_teamColor
 *
 * Public: Yes
 */

params ["_team", ["_alpha", 1]];

private _ret = ace_nametags_nametagColorMain;

switch (toLower (format ["%1", _team])) do {
  case "red";
  case "2": {_ret = ace_nametags_nametagColorRed;};
  case "green";
  case "3": {_ret = ace_nametags_nametagColorGreen;};
  case "blue";
  case "4": {_ret = ace_nametags_nametagColorBlue;};
  case "yellow";
  case "5": {_ret = ace_nametags_nametagColorYellow;};
};

_ret set [3, _alpha];
_ret
