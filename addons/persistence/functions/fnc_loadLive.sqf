#include "script_component.hpp"
#include "\achilles\modules_f_ares\module_header.h"

private _data = -1 call Ares_fnc_GetArrayDataFromUser;

if (typeName _data == "STRING") then {
  systemChat "Failed to parse data";
  systemChat _data;
} else {
  {
    systemChat format ["%1", _x select 0];
    switch (_x select 0) do {
      case "vehicles": {
        {
          private _veh = (_x select 0) createVehicle (_x select 1);
          _veh setPosWorld (_x select 2);
          _veh setVectorDir (_x select 3);
          _veh setVectorUp (_x select 4);
          private _damage = (_x select 6);
          {
            _veh setHitPointDamage [_x, _damage select _forEachIndex, false];
          } forEach (_x select 5);
          _veh setFuel (_x select 7);
          _veh lock (_x select 8);

          [_veh, (_x select 9)] call FUNC(loadContainer);

          (getAssignedCuratorLogic player) addCuratorEditableObjects [[_veh], true];
        } forEach (_x select 1);
      };
      case "objects": {
        {
          private _veh = (_x select 0) createVehicle (_x select 1);
          _veh setPosWorld (_x select 2);
          _veh setVectorDir (_x select 3);
          _veh setVectorUp (_x select 4);
          [_veh, (_x select 5)] call FUNC(loadContainer);
          (getAssignedCuratorLogic player) addCuratorEditableObjects [[_veh], true];
        } forEach (_x select 1);
      };
    };
  } forEach _data;
};

#include "\achilles\modules_f_ares\module_footer.h"
