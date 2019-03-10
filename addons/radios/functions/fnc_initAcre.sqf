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
