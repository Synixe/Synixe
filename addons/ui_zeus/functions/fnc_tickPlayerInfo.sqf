#include "script_component.hpp"
/*
 * Author: Brett
 * Updates the 3D player info display
 *
 * Public: No
 */

{
  private _distance = curatorCamera distance _x;
  if (_distance > 15 || {[objNull, "VIEW"] checkVisibility [eyePos curatorCamera, aimPos _x] < 0.25}) exitWith {1};

  _x setVariable [QGVAR(offset), -10];
  if (GVAR(displayName)) then {
    [_x, name _x] call FUNC(drawInfo);
  };
  if (GVAR(displayRole) && {!(roleDescription _x isEqualTo "")}) then {
    [_x, roleDescription _x] call FUNC(drawInfo);
  };
  if (GVAR(displayFps)) then {
    [_x, format ["FPS: %1", str (_x getVariable [QGVAR(fps), 0])]] call FUNC(drawInfo);
  };
  if (GVAR(displayTeam)) then {
    private _team = _x getVariable [QGVAR(team), "MAIN"];
    private _color = (_team call EFUNC(fireteams,teamNumber)) call EFUNC(fireteams,teamColorValues);
    [_x, _team, _color] call FUNC(drawInfo);
  };
  if (_x getVariable ["ace_spectator_isSet", false]) then {
    [_x, "Spectating"] call FUNC(drawInfo);
  } else {
    if (GVAR(displayRadios)) then {
      if (isClass(configFile >> "CfgPatches" >> "acre_main")) then {
        private _radios = "";
        private _count = 0;
        {
          if (_count > 0) then {
            _radios = _radios + ", ";
          };
          _radios = _radios + (_x call EFUNC(common,itemName));
          _count = _count + 1;
        } forEach (_x getVariable [QGVAR(radios), []]);
        if (_radios isEqualTo "") then {
          [_x, "No Radio"] call FUNC(drawInfo);
        } else {
          [_x, _radios] call FUNC(drawInfo);
        };
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
        [_x, format ["Lives: %1", lives]] call FUNC(drawInfo);
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
