#include "script_component.hpp"
/*
 * Author: Brett
 * Updates the 3D player info display
 *
 * Public: No
 */

{
  _x setVariable [QGVAR(offset), -10];

  private _distance = curatorCamera distance _x;
  if (_distance > 15) exitWith {
    [_x, "TOO FAR"] call FUNC(drawInfo);
  };
  if ([objNull, "VIEW"] checkVisibility [eyePos curatorCamera, aimPos _x] < 0.25) exitWith {
    [_x, "HIDDEN"] call FUNC(drawInfo);
  };

  if (GVAR(displayName)) then {
    [_x, name _x] call FUNC(drawInfo);
  };
  if (GVAR(displayRole) && {!(roleDescription _x isEqualTo "")}) then {
    [_x, roleDescription _x] call FUNC(drawInfo);
  };
  if (GVAR(displayFps)) then {
    [_x, format ["%1 FPS", str (_x getVariable [QGVAR(fps), 0])]] call FUNC(drawInfo);
  };
  if (GVAR(displayTeam)) then {
    private _team = assignedTeam _x;
    private _color = _team call EFUNC(ui,teamColor);
    [_x, _team, _color] call FUNC(drawInfo);
  };
  if (_x getVariable ["ace_spectator_isSet", false]) then {
    [_x, "Spectating"] call FUNC(drawInfo);
  } else {
    if (GVAR(displayRadios)) then {
      if (isClass(configFile >> "CfgPatches" >> "acre_main")) then {
        private _unit = _x;
        {
          private _name = _x#0 splitString "_";
          _name = _name select ((count _name) - 3);
          _name = [_name, "prc", ""] call GOM_fnc_replaceInString;
          private _freq = _x#1;
          if (_name isEqualTo "343") then {
            private _block = floor (_freq / 16);
            private _channel = _freq - _block * 16;
            _freq = format ["%1-%2", _block + 1, _channel];
          };
          [_unit, format ["%1: %2", _name, _freq]] call FUNC(drawInfo);
        } forEach (_x getVariable [QGVAR(radios), []]);
      };
      if (isClass(configFile >> "CfgPatches" >> "tfar_core")) then {
        private _asw = _x getVariable [QGVAR(asw), ""];
        if (_asw isEqualTo "") then {
          [_x, _x getVariable [QGVAR(psw), "No Radio"]] call FUNC(drawInfo);
        } else {
          [_x, format ["%1 (%2)", _x getVariable [QGVAR(psw), "NA"], _asw]] call FUNC(drawInfo);
        };
      };
    };
    if (GVAR(displayACEMedicalLives)) then {
      private _lives = _x getVariable ["ace_medical_amountOfReviveLives", 0];
      if !(_lives isEqualTo -1) then {
        [_x, format ["Lives: %1", _lives]] call FUNC(drawInfo);
      };
    };
    if (GVAR(displayACEMedical)) then {
      if (_x getVariable ["ACE_isUnconscious", false]) exitWith {
        [_x, "Unconscious", [1,0.5,0.5,1]] call FUNC(drawInfo);
      };
      if (_x getVariable ["ace_medical_isBleeding", false]) exitWith {
        [_x, "Injured", [1,0.5,0.5,1]] call FUNC(drawInfo);
      };
      if (_x getVariable ["ace_medical_hasLostBlood", 0] > 0) exitWith {
        [_x, format ["Blood Loss: %1", _x getVariable ["ace_medical_hasLostBlood", 0]], [1,0.5,0.5,1]] call FUNC(drawInfo);
      };
      if (_x getVariable["ace_medical_hasPain", false]) exitWith {
        [_x, "In Pain", [1,0.5,0.5,1]] call FUNC(drawInfo);
      };
      [_x, "Healthy"] call FUNC(drawInfo);
    };
  };
} forEach allPlayers;
