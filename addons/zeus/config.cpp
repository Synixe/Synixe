#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = COMPONENT;
    units[] = {QGVAR(Module_EndScenario)};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {};
    author = "SynixeBrett";
    VERSION_CONFIG;
  };
};

#include "CfgEventHandlers.hpp"

class CfgFactionClasses {
  class NO_CATEGORY;
  class SYNIXE_ZEUS: NO_CATEGORY {
    displayName = CSTRING(ZeusCategory);
  };
};

#include "CfgVehicles.hpp"
#include "RscAttributes.hpp"

class RscTitles {
  class RscMissionEnd;
  class SynixeMissionEnd: RscMissionEnd {
    onLoad = QUOTE(call FUNC(ui_missionEnd));
  };
};
