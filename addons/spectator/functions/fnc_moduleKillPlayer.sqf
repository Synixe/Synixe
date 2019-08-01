#include "script_component.hpp"
/*
 * Author: SynixeBrett
 * Kills a player with the spectator system
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call synixe_spectator_fnc_moduleKillPlayer
 *
 * Public: No
 */

params ["_logic"];

if !(local _logic) exitWith {};

(missionNamespace getVariable ["bis_fnc_curatorObjectPlaced_mouseOver",[""]]) params ["_mouseOverType", "_mouseOverUnit"];

if (_mouseOverType != "OBJECT") exitWith { [LSTRING(NothingSelected)] call FUNC(showMessage); deleteVehicle _logic; };
if !(alive _mouseOverUnit) exitWith { ["str_a3_bis_fnc_modulearsenal_errordead"] call FUNC(showMessage); deleteVehicle _logic; };

GVAR(loadouts) setVariable [str (getPlayerUID _mouseOverUnit), getUnitLoadout _mouseOverUnit, true];

[_mouseOverUnit, true] call ace_medical_fnc_setDead;

deleteVehicle _logic;
