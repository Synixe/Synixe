#include "script_component.hpp"

params ["_unit", "_alpha"];

private _ret = [1, 0.5, 0, _alpha];

if (group ace_player isEqualTo group _unit) then {
  if (_unit getVariable [QGVAR(considerDead), false]) then {
    _ret =  [0, 0, 0, _alpha];
  } else {
    _ret = ([assignedTeam _unit, _alpha] call FUNC(teamColor));
  };
};

_ret
