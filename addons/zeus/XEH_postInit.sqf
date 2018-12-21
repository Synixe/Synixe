#include "script_component.hpp"

0 spawn {
  waitUntil {!isNull (getAssignedCuratorLogic player)};
  (getAssignedCuratorLogic player) addEventHandler ["CuratorObjectPlaced", {
    if (GVAR(properPlacement) && {!(call EFUNC(common,selectedFaction) isEqualTo "empty")}) then {
      params ["", "_entity"];
      systemChat format ["side: %1 %2", side _entity, alive _entity];
      _entity allowDamage false;
      {
        _x allowDamage false;
      } forEach crew _entity;
      _entity setPosASL [0,0,100];
      private _pos = AGLtoASL screenToWorld getMousePosition;
      private _intersections = lineIntersectsSurfaces [getPosASL curatorCamera, _pos];
      if((count _intersections) != 0) then {
        private _placePos = ((_intersections select 0) select 0);
        _entity setPosASL [_placePos select 0, _placePos select 1, (_placePos select 2) + 0.1];
      } else {
        _entity setPosASL [_pos select 0, _pos select 1, (_pos select 2) + 0.1];
      };
      _entity spawn {
        params ["_entity"];
        sleep 0.5;
        _entity allowDamage true;
        {
          _x allowDamage true;
        } forEach crew _entity;
      };
    };
  }];
};
