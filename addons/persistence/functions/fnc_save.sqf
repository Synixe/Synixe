#include "script_component.hpp"
#include "\achilles\modules_f_ares\module_header.h"

private _blacklist =
[
  "ModuleCurator_F",
  "GroundWeaponHolder",
  "Salema_F",
  "Ornate_random_F",
  "Mackerel_F",
  "Tuna_F",
  "Mullet_F",
  "CatShark_F",
  "Rabbit_F",
  "Snake_random_F",
  "Turtle_F",
  "Hen_random_F",
  "Cock_random_F",
  "Cock_white_F",
  "Sheep_random_F",
  "Logic"
];

private _dialogResult = [
  "Save Mission State",
  [
    ["Range", ["50m", "100m", "500m", "1km", "2km", "5km", "Entire Map"], 6],
    ["Include Empty Vehicles", ["Yes", "No"]],
    ["Include Objects", ["Yes", "No"]]
  ]
] call Ares_fnc_ShowChooseDialog;
if (count _dialogResult == 0) exitWith { "User cancelled dialog."; };

private _position = _this select 0;
private _radius = 100;
switch (_dialogResult select 0) do
{
  case 0: { _radius = 50; };
  case 1: { _radius = 100; };
  case 2: { _radius = 500; };
  case 3: { _radius = 1000; };
  case 4: { _radius = 2000; };
  case 5: { _radius = 5000; };
  case 6: { _radius = -1; };
  default { _radius = 100; };
};

private _includeEmptyVehicles = if (_dialogResult select 1 == 0) then { true; } else { false; };
private _includeEmptyObjects = if (_dialogResult select 2 == 0) then { true; } else { false; };

private _emptyObjects = [];
private _emptyVehicles = [];
private _groups = [];

{
  private _ignore = false;
  if ((typeOf _x) in _blacklist || isPlayer _x) then {
    _ignore = true;
  };
  if (!_ignore && {(_x distance _position <= _radius) || _radius == -1}) then {
    private _isUnit =  (_x isKindOf "CAManBase")
                    || (_x isKindOf "car")
                    || (_x isKindOf "tank")
                    || (_x isKindOf "air")
                    || (_x isKindOf "StaticWeapon")
                    || (_x isKindOf "ship");
    if (_isUnit) then {
      if (_x isKindOf "CAManBase") then {
        if !((group _x) in _groups) then {
          _groups pushBack (group _x);
        };
      } else {
        if (count crew _x > 0) then {
          if !((group _x) in _groups) then {
            _groups pushBack (group _x);
          };
        } else {
          _emptyVehicles pushBack _x;
        };
      };
    } else {
      if (side _x != sideUnknown && side _x != sideLogic) then {
        _emptyObjects pushBack _x;
      };
    };
  };
} forEach allMissionObjects "";

private _output = [];
if (!_includeEmptyVehicles) then { _emptyVehicles = []; };
if (!_includeEmptyObjects) then { _emptyObjects = []; };

//Vehicles
_output pushBack "[""vehicles"",[";
private _first = true;
{
  if !(_first) then {
    _output pushBack ",";
  } else {
    _first = false;
  };
  private _hitpoints = (getAllHitPointsDamage _x);
  private _points = [];
  private _damage = [];
  if !(count _hitpoints == 0) then {
    _points = _hitpoints select 0;
    _damage = _hitpoints select 2;
  };
  _output pushBack format [
    "[""%1"", %2, %3, %4, %5, %6, %7, %8, %9, %10]",
    (typeOf _x),
    (position _x),
    (getPosWorld _x),
    (vectorDir _x),
    (vectorUp _x),
    _points,
    _damage,
    (fuel _x),
    (locked _x),
    _x call FUNC(containers)
  ];
} forEach _emptyVehicles;
_output pushBack "]]";

//Objects
_output pushBack ",[""objects"",[";
private _first = true;
{
  if !(_first) then {
    _output pushBack ",";
  } else {
    _first = false;
  };
  _output pushBack format ["[""%1"", %2, %3, %4, %5]",
    (typeOf _x), (position _x), (getPosWorld _x), (vectorDir _x), (vectorUp _x)
  ];
} forEach _emptyObjects;
_output pushBack "]]";

private _text = "[";
{
  _text = _text + _x;
  [_x] call Ares_fnc_LogMessage;
} forEach _output;
_text = _text + "]";
uiNamespace setVariable ['Ares_CopyPaste_Dialog_Text', _text];
_dialog = createDialog "Ares_CopyPaste_Dialog";
["Mission SQF"] call Ares_fnc_ShowZeusMessage;

#include "\achilles\modules_f_ares\module_footer.h"
