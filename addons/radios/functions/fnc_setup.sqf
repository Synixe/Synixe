#include "script_component.hpp"

INFO("Running radio setup");

0 spawn {
  // Just sleep to make sure they've had time to receive the radios
  // may not be needed
  sleep 1;
  INFO("- Waiting for ACRE");
  waitUntil {[] call acre_api_fnc_isInitialized};

  // No radios on PMC missions
  if (getMissionConfigValue ["pmcEnabled", ""] isEqualTo "") then {
    if (player getVariable [QGVAR(notReceived), true] && {getMissionConfigValue [QGVAR(receiveStandard), true]}) then {
      INFO_1("- Giving Radios for role: %1", player getVariable [QEGVAR(fireteams,role), "RF"]);
      if !([player, RIFLEMAN_RADIO] call acre_api_fnc_hasKindOfRadio) then {
        INFO_1("- %1", RIFLEMAN_RADIO);
        player addItem RIFLEMAN_RADIO;
      };

      switch (player getVariable [QEGVAR(fireteams,role), ""]) do {
        case "SL": {
          if !([player, SQUAD_RADIO] call acre_api_fnc_hasKindOfRadio) then {
            INFO_1("- %1", SQUAD_RADIO);
            player addItem SQUAD_RADIO;
          };
          if !([player, LONGRANGE_RADIO] call acre_api_fnc_hasKindOfRadio) then {
            INFO_1("- %1", LONGRANGE_RADIO);
            player addItemToBackpack LONGRANGE_RADIO;
          };
        };
        case "TL": {
          if !([player, SQUAD_RADIO] call acre_api_fnc_hasKindOfRadio) then {
            INFO_1("- %1", SQUAD_RADIO);
            player addItem SQUAD_RADIO;
          };
        };
      };
      player setVariable [QGVAR(notReceived), false];
    };
  };

  waitUntil { ([] call acre_api_fnc_isInitialized) };

  // No radios on PMC missions
  if (getMissionConfigValue ["pmcEnabled", ""] isEqualTo "") then {
    INFO("- Setting Frequencies");
    private _block = GVAR(callsigns) getVariable [tolower (groupId (group player)), 6];
    INFO_1("-   Squad Block: %1", _block);

    private _hasRifleman = false;
    private _hasSquad = false;
    private _hasLong = false;

    if ([player, RIFLEMAN_RADIO] call acre_api_fnc_hasKindOfRadio) then {
      _hasRifleman = true;
      private _riflemanRadio = [RIFLEMAN_RADIO] call acre_api_fnc_getRadioByType;
      INFO_2("-   Setting %1:%2", RIFLEMAN_RADIO, _riflemanRadio);
      [_riflemanRadio, ((_block - 1) * 16) + ((assignedTeam player) call EFUNC(fireteams,teamNumber)) + 1] call acre_api_fnc_setRadioChannel;
      [_riflemanRadio, "LEFT"] call acre_api_fnc_setRadioSpatial;
    };

    if ([player, SQUAD_RADIO] call acre_api_fnc_hasKindOfRadio) then {
      _hasSquad = true;
      private _squadRadio = [SQUAD_RADIO] call acre_api_fnc_getRadioByType;
      INFO_2("-   Setting %1:%2", SQUAD_RADIO, _squadRadio);
      if (getMissionConfigValue [QGVAR(singleSquadnet), false]) then {
        [_squadRadio, 1] call acre_api_fnc_setRadioChannel;
      } else {
        [_squadRadio, _block] call acre_api_fnc_setRadioChannel;
      };
      [_squadRadio, "RIGHT"] call acre_api_fnc_setRadioSpatial;
    };

    if ([player, LONGRANGE_RADIO] call acre_api_fnc_hasKindOfRadio) then {
      INFO_1("-   Setting %1", LONGRANGE_RADIO);
      _hasLong = true;
      //private _longRadio = [LONGRANGE_RADIO] call acre_api_fnc_getRadioByType;
      //[_longRadio, ("COMMAND" call EFUNC(common,callsignBlock))] call acre_api_fnc_setRadioChannel;
    };

    private _order = [];
    if (_hasRifleman) then {
      _order pushBack ([RIFLEMAN_RADIO] call acre_api_fnc_getRadioByType);
    };
    if (_hasSquad) then {
      _order pushBack ([SQUAD_RADIO] call acre_api_fnc_getRadioByType);
    };
    if (_hasLong) then {
      _order pushBack ([LONGRANGE_RADIO] call acre_api_fnc_getRadioByType);
    };
    INFO_2("- Setting PTT Order: %1 - %2", _order, [_order] call acre_api_fnc_setMultiPushToTalkAssignment);
  };
};
