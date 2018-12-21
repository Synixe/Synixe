/*
 * Author: Brett
 * Returns the color of numerical team
 *
 * Arguments:
 * 0: _team <NUMBER>
 *
 * Return Value:
 * color <STRING>
 *
 * Example:
 * 2 call synixe_fireteams_fnc_teamColor
 *
 * Public: Yes
 */

private _ret = "MAIN";

switch (_this) do {
  case "1";
  case 1: {_ret = "RED";};
  case "2";
  case 2: {_ret = "GREEN";};
  case "3";
  case 3: {_ret = "BLUE";};
  case "4";
  case 4: {_ret = "YELLOW";};
};

_ret
