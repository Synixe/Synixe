#include "script_component.hpp"

//In the future it would be nice to automatically track who comes to missions.
//"synixe" callExtension ["setup", [getPlayerUID player]];
"synixe" callExtension "setup";

private _role = "https://synixe.com";
private _mission = "";

if (isServer) then {
  _mission = "Editing Missions";
} else {
  if (roleDescription player != "") then {
    _role = roleDescription player;
  };
  _mission = missionName;
  if (_mission == "tempMissionSP") then {
    _mission = "Editing Missions";
  } else {
    _mission = briefingName;
  };
};

private _response = "synixe" callExtension [
  "update",
  [
    _mission, _role, toLower(worldName),
    getText (configfile >> "CfgWorlds" >> worldname >> "description")
  ]
];
_response