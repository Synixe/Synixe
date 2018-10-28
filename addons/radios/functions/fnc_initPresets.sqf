#include "script_component.hpp"

{
  private _name = configName _x;
  diag_log format ["Loading Radio Preset: %1", _name];
  {
    private _channel = parseNumber (((configName _x) splitString "nel") select 1);
    diag_log format ["- Creating Channel: %1", _channel];
    {
      private _key = configName _x;
      private _value = getText _x;
      diag_log format["--- Setting Value %1 : %2", _key, _value];
      {
        [_x, _name, _channel, _key, _value] call acre_api_fnc_setPresetChannelField;
      } forEach [SQUAD_RADIO, LONGRANGE_RADIO];
    } forEach configProperties [_x, "true", true];
  } forEach configProperties [_x, "true", true];
} forEach configProperties [configFile >> "RadioPresets", "true", true];
