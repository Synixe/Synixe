#include "script_component.hpp"

params ["_container"];

private _weaponsItems = weaponsItemsCargo _container;
if (isNull _weaponsItems) then {
  _weaponsItems = [];
};

private _tree = [
  [
    getMagazineCargo _container,
    _weaponsItems,
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
