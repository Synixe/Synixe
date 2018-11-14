#include "script_component.hpp"

params ["_logic", "_title", "_subtitle", "_fail"];
TRACE_1("params",_this);

missionNamespace setVariable [QGVAR(endTitle), _title, true];
missionNamespace setVariable [QGVAR(endSubtitle), _subtitle, true];

[-2, {
  [!_this] call FUNC(end);
}, _fail] call CBA_fnc_globalExecute;

deleteVehicle _logic;
