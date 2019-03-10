#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = COMPONENT;
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"synixe_main"};
    author = "SynixeBrett";
    VERSION_CONFIG;
  };
};

class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay {
  class Spotlight {
    class SynixeServer {
      text = "Synixe";
      textIsQuote = 0;
      picture = "\z\synixe\addons\main\media\synixe.paa";
      video = "\z\synixe\addons\main\media\synixe.ogv";
      action = "0 = [_this, 'arma.synixe.com', '2302', 'space'] execVM '\z\synixe\addons\common\functions\fnc_joinServer.sqf';";
      actionText = "Connect to Synixe";
      condition = "true";
    };
  };
};

#include "CfgEventHandlers.hpp"
