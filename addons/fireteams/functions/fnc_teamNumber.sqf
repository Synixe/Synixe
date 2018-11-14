/*
 * Author: Brett
 * Returns the number of team color
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

private _ret = 0;

switch (tolower _this) do {
  case "red": {_ret = 1;};
  case "green": {_ret = 2;};
  case "blue": {_ret = 3;};
  case "yellow": {_ret = 4;};
};

_ret
