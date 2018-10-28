#include "script_component.hpp"

{
  private _group = _x;
  if ((groupId _group) find " " == -1) then {
    diag_log format ["Processing Group: %1", groupId _group];
    if ((groupId _group) find "-" != -1) then {
      private _split = (groupId _group) splitString "-";
      private _parentGroup = _split select 0;
      private _parent = [side _x, _parentGroup] call FUNC(groupExists);
      diag_log format ["- Parent Group %1 is %2", _parentGroup, _parent];
      private _team = _split select 1;
      diag_log format ["- Color for %1 is %2", groupId _group, _team];
      diag_log format ["- Units: %1", units _group];
      {
        if !(_x getVariable [QGVAR(processed), false]) then {
          diag_log format ["- Processing %1", _x];
          if (leader _group isEqualTo _x) then {
            if (missionNamespace getVariable [format["leader_%1", groupId _group], objNull] isEqualTo objNull) then {
              missionNamespace setVariable [format["leader_%1", groupId _group], _x];
              _x setVariable [QGVAR(role), "TL", true];
            };
          };
          if (_parent isEqualTo grpNull) then {
            _parent = createGroup [side _group, true];
            _parent setGroupId [_parentGroup];
          };
          [_x] joinSilent _parent;
          [_x, _team call FUNC(teamColor)] spawn {
            params ["_unit", "_team"];
            sleep 0.5;
            _unit assignTeam _team;
          };
          [QGVAR(groupChange), [_x, _team call FUNC(teamColor)], _x] call CBA_fnc_targetEvent;
          _x setVariable [QGVAR(processed), true];
          [QGVAR(processed), [_x], _x] call CBA_fnc_targetEvent;
        };
      } forEach units _group;
    };
  } else {
    INFO_1("Ignoring Group: %1", groupId _group);
    (leader _group) setVariable [QGVAR(role), "SL", true];
    {
      INFO_1("- Processing %1", _x);
      _x setVariable [QGVAR(processed), true];
      [QGVAR(processed), [_x], _x] call CBA_fnc_targetEvent;
    } foreach units _group;
  };
} forEach allGroups;
