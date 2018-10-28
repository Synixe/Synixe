#include "script_component.hpp"

[QGVAR(groupChange), {
  params ["_unit", "_team"];
  _unit assignTeam _team;
}] call CBA_fnc_addEventHandler;

if (isServer) then {
  0 spawn {
    sleep 3;
    diag_log "Starting Organize";
    call FUNC(organize);

    [QGVAR(playerJoined), {
      params ["_name", "_unit"];
      diag_log format ["Person %1 joined as %2, processing groups", _name, _unit];
      call FUNC(organize);
    }] call CBA_fnc_addEventHandler;
  };
};

if (hasInterface) then {

  INFO("Setting up fireteams locally");

  [QGVAR(processed), {
    params ["_unit"];
    diag_log format ["Local Unit Processed: %1", _unit];
    if (_unit isEqualTo player) then {
      call EFUNC(radios,setup);
    };
  }] call CBA_fnc_addEventHandler;

  player setVariable [QGVAR(originalGroup), groupId group player, true];
  player setVariable [QGVAR(originalTeam), parseNumber ((groupId group player) splitString "-" select 1), true];

  [QGVAR(playerJoined), [profileName, player]] call CBA_fnc_globalEvent;

};
