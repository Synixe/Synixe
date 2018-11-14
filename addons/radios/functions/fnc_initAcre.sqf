#include "script_component.hpp"

call FUNC(initPresets);
// Setup Global Babel
private _allLanguages = [];
private _languages = configProperties [configFile >> "Babel" >> "Languages", "true", true];
{
  [configName _x, getText _x] call acre_api_fnc_babelAddLanguageType;
  _allLanguages pushBack (configName _x);
} forEach _languages;

if !(hasInterface) exitWith {0};

private _spoken = configFile >> "Babel" >> "Spoken";

switch (side player) do {
  case west: {
    (getArray (_spoken >> "west")) call acre_api_fnc_babelSetSpokenLanguages;
  };
  case east: {
    (getArray (_spoken >> "east")) call acre_api_fnc_babelSetSpokenLanguages;
  };
  case independent: {
    (getArray (_spoken >> "independent")) call acre_api_fnc_babelSetSpokenLanguages;
  };
  case civilian: {
    (getArray (_spoken >> "civilian")) call acre_api_fnc_babelSetSpokenLanguages;
  };
  case sideLogic: {
    _allLanguages call acre_api_fnc_babelSetSpokenLanguages;
  };
};

{
  private _preset = (getMissionConfigValue [QGVAR(preset), "standard"]);
  [_x, _preset] call acre_api_fnc_setPreset;
} forEach [SQUAD_RADIO, LONGRANGE_RADIO];

private _firstrun = profileNamespace getVariable [QGVAR(firstSetup), true];
if (_firstrun) then {

  //Bind Babel cycle to Shift + Space
  ["acre2$babelcyclekey", [[57,[true,false,false]]]] call EFUNC(common,setCBAKey);

  //Unbind Default PPT Key
  ["acre2$defaultpttkey", []] call EFUNC(common,setCBAKey);

  //Bind first radio to Caps Lock and Shift + Caps Lock
  ["acre2$altpttkey1", [[58,[false,false,false]],[58,[true,false,false]]]] call EFUNC(common,setCBAKey);

  //Bind second radio to Control + Caps Lock
  ["acre2$allpttkey2", [[58,[false,true,false]]]] call EFUNC(common,setCBAKey);

  //Bind third radio to Alt + Caps Lock
  ["acre2$allpttkey3", [[58,[false,false,true]]]] call EFUNC(common,setCBAKey);

  profileNamespace setVariable [QGVAR(firstSetup), false];
  saveProfileNamespace;

  0 spawn {
    sleep 10;
    systemChat "The recommended ACRE keybinds have been applied for the best use with Synixe.";
    systemChat "You may change any ACRE keybinding to suit your play style.";
  };
};
