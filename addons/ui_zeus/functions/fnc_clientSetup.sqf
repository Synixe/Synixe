#include "script_component.hpp"

[{
  player setVariable [QGVAR(fps), floor diag_fps, true];
  if (isClass(configFile >> "CfgPatches" >> "acre_main")) then {
    player setVariable [QGVAR(radios), call acre_api_fnc_getCurrentRadioList, true];
  };
  if (isClass(configFile >> "CfgPatches" >> "tfar_core")) then {
    player setVariable [QGVAR(psw), call TFAR_fnc_currentSwFrequency, true];
    player setVariable [QGVAR(asw), [(call TFAR_fnc_activeSwRadio), ((call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getAdditionalSwChannel) + 1] call TFAR_fnc_getChannelFrequency, true];
  };
}, 1] call CBA_fnc_addPerFrameHandler;

addMissionEventHandler ["Draw3D", {
  if (call EFUNC(common,inZeus) && {!(call EFUNC(common,inZeusScreenshot))}) then {
    if (GVAR(displayPlayerInfo)) then {
      call FUNC(tickPlayerInfo);
    };
    if (GVAR(visibilityIndicator)) then {
      call FUNC(tickVisibility);
    };
  };
}];

// TODO Maybe move into zeus
[{!isNull (getAssignedCuratorLogic player)}, {
  (getAssignedCuratorLogic player) addEventHandler ["CuratorObjectPlaced", {
    call FUNC(handlePlacement);
  }];
}] call CBA_fnc_waitUntilAndExecute;
