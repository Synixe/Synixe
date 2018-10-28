#include "script_component.hpp"

if (getMissionConfigValue QGVAR(receiveRadios)) then {
  diag_log "Giving Radios";
  if !([player, RIFLEMAN_RADIO] call acre_api_fnc_hasKindOfRadio) then {
    diag_log format ["- %1", RIFLEMAN_RADIO];
    player addItem RIFLEMAN_RADIO;
  };

  switch (player getVariable [QEGVAR(fireteams,role), ""]) do {
    case "SL": {
      if !([player, SQUAD_RADIO] call acre_api_fnc_hasKindOfRadio) then {
        diag_log format ["- %1", SQAUD_RADIO];
        player addItem SQUAD_RADIO;
      };
      if !([player, LONGRANGE_RADIO] call acre_api_fnc_hasKindOfRadio) then {
        diag_log format ["- %1", LONGRANGE_RADIO];
        player addItemToBackpack LONGRANGE_RADIO;
      };
    };
    case "TL": {
      if !([player, SQUAD_RADIO] call acre_api_fnc_hasKindOfRadio) then {
        diag_log format ["- %1", SQAUD_RADIO];
        player addItem SQUAD_RADIO;
      };
    };
  };
};
