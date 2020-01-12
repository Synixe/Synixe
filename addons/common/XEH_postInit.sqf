#include "script_component.hpp"

if (!hasInterface) exitWith {0};

player call FUNC(giveEarplugs);
ace_hearing_disableVolumeUpdate = true;
0 call FUNC(discord);

if (!isMultiplayer) exitWith {0};

call FUNC(disableChat);

// Start with safety on
if (side player != sideLogic) then {
  if !(primaryWeapon player isEqualTo "") then {
    [player, primaryWeapon player, true] call ance_safemode_fnc_setWeaponSafety;
  };
  if !(secondaryWeapon player isEqualTo "") then {
    [player, secondaryWeapon player, true] call ance_safemode_fnc_setWeaponSafety;
  };
};

[{time > 0 && !(isNull player)}, //Wait for player to be loaded
  FUNC(breath)
] call CBA_fnc_waitUntilAndExecute;

["ace_arsenal_displayClosed", {
  if (getMissionConfigValue ["pmcEnabled", ""] isEqualTo "") exitWith {
    player call FUNC(giveEarplugs);
  };
}] call CBA_fnc_addEventHandler;
