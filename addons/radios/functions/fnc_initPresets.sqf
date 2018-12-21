#include "script_component.hpp"

// Radio Presets

{
  private _name = configName _x;
  diag_log format ["Loading Radio Preset: %1", _name];
  {
    [_x, "default", _name] call acre_api_fnc_copyPreset;
  } forEach [SQUAD_RADIO, LONGRANGE_RADIO];
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

// Radio Callsigns

if (isServer) then {
  GVAR(callsigns) = true call CBA_fnc_createNamespace;
  publicVariable QGVAR(callsigns);
  {
    GVAR(callsigns) setVariable [tolower (configName _x), getNumber _x, true];
  } forEach configProperties [configFile >> "RadioCallsigns", "true", true];
};
