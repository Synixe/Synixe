#include "script_component.hpp"

params ["_container"];

systemChat format ["Checking cargo for %1", _container];

private _tree = [
  [
    getMagazineCargo _container,
    getWeaponCargo _container,
    getItemCargo _container
  ]
];

private _containers = [];

{
  _containers pushBack [
    _x select 0,
    [_x select 1] call FUNC(containers)
  ]
} forEach everyContainer _container;

_tree pushBack _containers;

_tree
