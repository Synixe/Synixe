#include "script_component.hpp"
/*
 * Author: SynixeBrett
 * Zeus module function to respawn a player
 *
 * Arguments:
 * 0: Respawn at <OBJECT>
 * 1: Player UID <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "5854854754"] call synixe_spectator_fnc_moduleRespawnPlayer
 *
 * Public: No
 */

params ["_logic", "_uid", "_loadout"];

// Get the chosen unit
private _player = [_uid] call BIS_fnc_getUnitByUID;
if (_player getVariable [QGVAR(dead), false]) then {
  private _position = _logic modelToWorld [0,0,0];
  [QGVAR(respawn), [_position, _loadout], _player] call CBA_fnc_targetEvent;
};

deleteVehicle _logic;
