#include "script_component.hpp"

[QGVAR(groupChange), {
  params ["_unit", "_team"];
  _unit assignTeam _team;
}] call CBA_fnc_addEventHandler;

if (isServer) then {
  GVAR(playerVars) = true call CBA_fnc_createNamespace;
  publicVariable QGVAR(playerVars);

  [QGVAR(playerJoined), {
    params ["_name", "_unit"];
    [{
      params ["_name", "_unit"];
      INFO_2("Person %1 joined as %2, processing groups", _name, _unit);
      if (GVAR(playerVars) getVariable [str (getPlayerUID _unit), []] isEqualTo []) then {
        call FUNC(organize);
      } else {
        (GVAR(playerVars) getVariable [str (getPlayerUID _unit), []]) params ["_team", "_parent"];
        [_unit] joinSilent _parent;
        [_unit, _team call FUNC(teamColor)] spawn {
          params ["_unit", "_team"];
          sleep 1;
          _unit assignTeam _team;
        };
        [QGVAR(groupChange), [_unit, _team call FUNC(teamColor)], _unit] call CBA_fnc_targetEvent;
        _unit setVariable [QGVAR(processed), true];
      };
    }, [_name, _unit], 2] call CBA_fnc_waitAndExecute;
  }] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
  INFO("Setting up fireteams locally");
  [QGVAR(processed), {
    params ["_unit"];
    if (_unit isEqualTo player) then {
      INFO("Player Processed");
      call EFUNC(radios,setup);
    };
  }] call CBA_fnc_addEventHandler;
  player setVariable [QGVAR(originalGroup), groupId group player, true];
  player setVariable [QGVAR(originalTeam), parseNumber ((groupId group player) splitString "-" select 1), true];
  [QGVAR(playerJoined), [profileName, player]] call CBA_fnc_globalEvent;
};
