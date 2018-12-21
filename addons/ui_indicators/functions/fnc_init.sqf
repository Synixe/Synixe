#include "script_component.hpp"

addMissionEventHandler ["Draw3D", {
  if (EGVAR(ui,ShowIndicators)) then {
    call FUNC(tick);
  };
}];
