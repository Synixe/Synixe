#include "script_component.hpp"

if (isServer) then {
  // Used to track loadouts after disconnect
  GVAR(loadouts) = true call CBA_fnc_createNamespace;
  publicVariable QGVAR(loadouts);

  // Used to track position after disconnect
  GVAR(position) = true call CBA_fnc_createNamespace;
  publicVariable QGVAR(position);

  // Used to track spectators after disconnect
  GVAR(spectators) = true call CBA_fnc_createNamespace;
  publicVariable QGVAR(spectators);
  
  if (getMissionConfigValue ["pmcEnabled", ""] isEqualTo "") then {
    addMissionEventHandler ["HandleDisconnect", {
      params ["_unit", "_id", "_uid", "_name"];
      LOG_2("Saving loadout of uid %1 with name %2", _uid, name _unit);
      GVAR(loadouts) setVariable [str _uid, getUnitLoadout _unit, true];
      GVAR(position) setVariable [str _uid, [getPos _unit, vehicle _unit], true];
    }];
  };

  private _marker = "respawn";
  if (getMarkerColor _marker isEqualTo "") then {
    createMarker [_marker, [0,0,0]];
    _marker setMarkerType "Empty";
  };
};

if (!hasInterface || {!isMultiplayer}) exitWith {0};

player setUnitLoadout [GVAR(loadouts) getVariable [str (getPlayerUID player), getUnitLoadout player], true];

private _position = GVAR(position) getVariable [str (getPlayerUID player), objNull];
if !(isNull _position) then {
  _position params ["_pos", "_veh"];
  if (!(_veh isEqualTo objNull) && {alive _veh}) then {
    if !(player moveInAny _veh) then {
      player setPos _pso;
    };
  } else {
    player setPos _pos;
  };
};

// Return to spectator if the player was in spectator when they disconnected
if (GVAR(spectators) getVariable [str (getPlayerUID player), false]) then {
  if (getMissionConfigValue ["pmcEnabled", ""] isEqualTo "") then {
    [player, true] call ace_medical_fnc_setDead;
  };
};

player addMPEventHandler ["MPKilled", {
  GVAR(loadouts) setVariable [str (getPlayerUID player), getUnitLoadout player, true];
  0 spawn {
    sleep 4;
    if (alive player) then {
      GVAR(spectators) setVariable [str (getPlayerUID player), true, true];
    };
  };
}];

// Switch to spectator upon death
player addEventHandler ["Respawn", {
  params ["", "_corpse"];
  private _pos = getPosASL _corpse;
  [true] call ace_spectator_fnc_setSpectator;
  player setVariable [QGVAR(dead), true, true];
  player setVariable [QGVAR(corpse), _corpse, true];
  player enableSimulation false;
  _pos spawn {
    sleep 0.2;
    ace_spectator_camera setPosASL _this;
  };
}];

// Respawn from Zeus
[QGVAR(respawn), {
  params ["_position", "_loadout"];
  player setVariable [QGVAR(dead), false, true];
  player setPos _position;
  player enableSimulation true;
  [false] call ace_spectator_fnc_setSpectator;
  GVAR(spectators) setVariable [str (getPlayerUID player), false, true];
  if (getMissionConfigValue ["pmcEnabled", ""] isEqualTo "") then {
    if (_loadout) then {
      player setUnitLoadout [GVAR(loadouts) getVariable [str (getPlayerUID player), []], true];
    };
  } else {
    player setUnitLoadout [[[],[],[],[],[],[],"","",[],["","","","","",""]], true];
  };
  deleteVehicle (player getVariable [QGVAR(corpse), objNull]);
}] call CBA_fnc_addEventHandler;

// TODO replace with onload for pause menu
[{
  if (player getVariable [QGVAR(dead), false]) then {
    private _pauseMenu = findDisplay 49;
    if !(isNull _pauseMenu) then {
      (_pauseMenu displayCtrl 1010) ctrlEnable false;
    };
  };
}] call CBA_fnc_addPerFrameHandler;
