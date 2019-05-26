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

          private _addCargoForContainer = {
            params ["_container", "_cargo"];

            private _standard = _cargo select 0;
            private _nested = _cargo select 1;

            //Magazine cargo
            clearMagazineCargoGlobal _container;
            {
              _container addMagazineCargoGlobal [_x, _standard select 0 select 1 select _forEachIndex];
            } forEach ((_standard select 0) select 0);

            //Weapon Cargo
            clearWeaponCargoGlobal _container;
            {
              _container addWeaponCargoGlobal [_x, _standard select 1 select 1 select _forEachIndex];
            } forEach ((_standard select 1) select 0);

            //Item Cargo
            clearitemCargoGlobal _container;
            {
              _container addItemCargoGlobal [_x, _standard select 2 select 1 select _forEachIndex];
            } forEach ((_standard select 2) select 0);

            //Nested Cargo
            {
              _x params ["_class", "_items"];
              _container addBackpackCargoGlobal [_class, 1];
              //Thanks Bohemia, the only way to find the container I just added is to loop over every container...
              {
                private _found = false;
                if (_x select 0 == _class) then {
                  //More Elegant code
                  if (
                    !_found &&
                    { (_x select 1) getVariable [QGVAR(NOEDIT), true] }
                  ) then {
                    [_x select 1, (_items)] call _addCargoForContainer;
                    (_x select 1) setVariable [QGVAR(NOEDIT), false];
                    _found = true;
                  };
                };
              } forEach everyContainer _container;
            } forEach _nested;
          };

          [_veh, (_x select 9)] call _addCargoForContainer;

          (getAssignedCuratorLogic player) addCuratorEditableObjects [[_veh], true];
        } forEach (_x select 1);
      };
      case "objects": {
        {
          private _veh = (_x select 0) createVehicle (_x select 1);
          _veh setPosWorld (_x select 2);
          _veh setVectorDir (_x select 3);
          _veh setVectorUp (_x select 4);
          (getAssignedCuratorLogic player) addCuratorEditableObjects [[_veh], true];
        } forEach (_x select 1);
      };
    };
  } forEach _data;
};

#include "\achilles\modules_f_ares\module_footer.h"
