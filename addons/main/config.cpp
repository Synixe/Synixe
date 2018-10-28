#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = COMPONENT;
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_common", "cba_settings"};
    author = "SynixeBrett";
    VERSION_CONFIG;
  };
};

class RscStandardDisplay;
class RscControlsGroup;
class RscPictureKeepAspect;
class RscDisplayStart: RscStandardDisplay {
  class controls {
    class LoadingStart: RscControlsGroup {
      class controls {
        class Logo: RscPictureKeepAspect {
          text = "\z\synixe\addons\main\media\synixe_logo_transparent_ca.paa";
          onLoad = "";
        };
      };
    };
  };
};
