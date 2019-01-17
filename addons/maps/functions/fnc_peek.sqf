/*
 * Author: Brett
 * Take a peek at a map
 *
 * Arguments:
 * 0: Map class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * _map call synixe_maps_fnc_peek
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_map"];

ace_player setVariable [QGVAR(isPeeking), true];
ace_player setVariable [QGVAR(peek_playerMap), ace_player call FUNC(getMap)];
ace_player unlinkItem (ace_player call FUNC(getMap));
ace_player linkItem _map;

openMap true;

0 spawn {
  waitUntil {!visibleMap};
  ace_player unlinkItem (ace_player call FUNC(getMap));
  ace_player linkItem (ace_player getVariable [QGVAR(peek_playerMap), ""]);
  ace_player setVariable [QGVAR(isPeeking), false];
};
