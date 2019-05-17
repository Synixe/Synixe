#include "script_component.hpp"

if (isServer) then {
  GVAR(loadouts) = true call CBA_fnc_createNamespace;
  publicVariable QGVAR(loadouts);
  
  addMissionEventHandler ["HandleDisconnect", {
	  params ["_unit", "_id", "_uid", "_name"];
	  GVAR(loadouts) setVariable [QGVAR(_uid), getUnitLoadout _unit, true];
  }];
};

if (!hasInterface || {!isMultiplayer}) exitWith {0};

player setUnitLoadout [GVAR(loadouts) getVariable [QGVAR(getPlayerUID player), getUnitLoadout player], true];

player addMPEventHandler ["MPKilled", {
  GVAR(loadouts) setVariable [QGVAR(getPlayerUID player), getUnitLoadout player, true];
}];

// Switch to spectator upon death
player addEventHandler ["Respawn", {
  params ["", "_corpse"];
  player setVariable [QGVAR(dead), true, true];
  player setVariable [QGVAR(corpse), _corpse, true];
  private _pos = getPosASL player;
  player setPosASL [0,0,5];
  player enableSimulation false;
  [true] call ace_spectator_fnc_setSpectator;
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
  if (_loadout) then {
    player setUnitLoadout [GVAR(loadouts) getVariable [QGVAR(getPlayerUID player), []], true];
  };
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
