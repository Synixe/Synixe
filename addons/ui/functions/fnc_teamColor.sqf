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

private _ret = [1, 1, 1, _alpha];

switch (_team) do {
  case "RED";
  case 2: {_ret = [1, 0, 0, _alpha];};
  case "GREEN";
  case 3: {_ret = [0, 1, 0, _alpha];};
  case "BLUE";
  case 4: {_ret = [0.1, 0.1, 1, _alpha];};
  case "YELLOW";
  case 5: {_ret = [1, 1, 0, _alpha];};
};

_ret
