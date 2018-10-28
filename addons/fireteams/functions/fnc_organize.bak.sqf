#include "script_component.hpp"

private _position = parseNumber(([[str player, count(toArray(str group player))+1] call BIS_fnc_trimString, " "] call BIS_fnc_splitString) select 0);
private _parentGroup = (groupId group player) splitString "-" select 0;

if (_parentGroup find " " == -1) then {
  if (_position == 1) then {
    if ((groupId group player) find "-" == -1) then {
      //Squad Leader
      player setVariable [QGVAR(role), "SL", true];
      [QGVAR(squadLeader), [group player]] call CBA_fnc_globalEvent;
    } else {
      //Team Leader
      private _parent = [side player, _parentGroup] call FUNC(groupExists);
      if !(_parent isEqualTo grpNull) then {
        [player] joinSilent _parent;
      };
      player setVariable [QGVAR(role), "TL", true];
    };
  } else {
    private _parent = [side player, _parentGroup] call FUNC(groupExists);
    if (_parent isEqualTo (group player)) then {
      //Squad Level Member
    } else {
      //Team Member
      if !(_parent isEqualTo grpNull) then {
        [player] joinSilent _parent;
      };
    };
  };
};
