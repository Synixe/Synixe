#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = QUOTE(COMPONENT);
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"synixe_main", "cba_settings"};
    author = "SynixeBrett";
    VERSION_CONFIG;
  };
};

#include "CfgEventHandlers.hpp"

class RscPictureKeepAspect;
class RscTitles {
  class RscMissionEnd {
    class controls {
      class Picture: RscPictureKeepAspect {
        text = "\z\synixe\addons\main\media\synixe_logo_transparent_ca.paa";
        colorText[] = {1,1,1,1};
      };
    };
  };
};
