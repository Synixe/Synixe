#include "script_component.hpp"

[QGVAR(groupChange), {
  params ["_unit", "_team"];
  _unit assignTeam _team;
}] call CBA_fnc_addEventHandler;

if (isServer) then {
  [QGVAR(playerJoined), {
    params ["_name", "_unit"];
    INFO_2("Person %1 joined as %2, processing groups", _name, _unit);
    call FUNC(organize);
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
