#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = QUOTE(COMPONENT);
    units[] = {QGVAR(Module_EndScenario)};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"synixe_main"};
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

class CfgDebriefing {
	class End1 {
		title = "Mission Completed";
		subtitle = "";
		picture = "\z\synixe\addons\main\media\synixe_logo_transparent_ca.paa";
		pictureColor[] = {1,1,1,1};
	};
};

class RscTitles {
  class RscMissionEnd;
  class SynixeMissionEnd: RscMissionEnd {
    onLoad = QUOTE(call FUNC(ui_missionEnd));
  };
};
