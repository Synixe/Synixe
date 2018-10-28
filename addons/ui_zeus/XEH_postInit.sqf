#include "script_component.hpp"

if (!hasInterface) exitWith {0};

addMissionEventHandler ["Draw3D", {
  if (call EFUNC(common,inZeus)) then {
    //Synixe Logo
    private _zeusLogo = (findDisplay 312) displayCtrl 15717;
    Achilles_var_iconSelection = "Achilles_var_iconSelection_Default";
    _zeusLogo ctrlSetText "\z\synixe\addons\main\media\synixe_logo_transparent_ca.paa";
    _zeusLogo ctrlSetTextColor [1, 1, 1, 0.6];
    _zeusLogo ctrlCommit 0;

    private _zeusLogo = (findDisplay 312) displayCtrl 15715;
    _zeusLogo ctrlSetText "\z\synixe\addons\main\media\synixe_logo_transparent_ca.paa";
    _zeusLogo ctrlSetTextColor [1, 1, 1, 1];
    _zeusLogo ctrlCommit 0;
  };
}];

if (!isMultiplayer) exitWith {0};

[{time > 0 && !(isNull player)}, //Wait for player to be loaded
  FUNC(clientSetup)
] call CBA_fnc_waitUntilAndExecute;
