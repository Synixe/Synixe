#include "script_component.hpp"

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
  //_container addWeaponCargoGlobal [_x, _standard select 1 select 1 select _forEachIndex];
  systemChat format ["loading %1", _x];
  _x params ["_weapon", "_supp", "_laser", "_optic", "_mag", "_bipod"];
  if !(count _x == 6) then {
    _x params ["", "", "", "", "", "_ugl", "_bipod2"];
    _container addMagazineAmmoCargo [_ugl select 0, 1, _ugl select 1];
    _bipod = _bipod2;
  };
  _container addWeaponCargo [_weapon, 1];
  {
    if !(_x isEqualTo "") then {
      systemChat format ["adding %1 to %2", _x, _container];
      _container addItemCargoGlobal [_x, 1];
    };
  } forEach [_supp, _laser, _optic, _bipod];
  if !(_mag isEqualTo []) then {
    systemChat format ["adding %1", _mag];
    _container addMagazineAmmoCargo [_mag select 0, 1, _mag select 1];
  };
  player removeWeapon _weapon;
} forEach (_standard select 1);

//Item Cargo
clearitemCargoGlobal _container;
{
  _container addItemCargoGlobal [_x, _standard select 2 select 1 select _forEachIndex];
} forEach ((_standard select 2) select 0);

//Nested Cargo
clearBackpackCargoGlobal _container;
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
