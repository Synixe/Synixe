#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = COMPONENT;
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"synixe_main","A3_UI_F"};
    author = "SynixeBrett";
    VERSION_CONFIG;
  };
};

#include "CfgEventHandlers.hpp"

class CfgInGameUI {
	class Cursor {
		select = "#(argb,1,1,1)color(0,0,0,0)";
		outArrow = "#(argb,1,1,1)color(0,0,0,0)";
		leader = "#(argb,1,1,1)color(0,0,0,0)";
		mission = "#(argb,1,1,1)color(0,0,0,0)";
		unitBleeding = "#(argb,1,1,1)color(0,0,0,0)";
		unitInjured = "#(argb,1,1,1)color(0,0,0,0)";
		unitHealer = "#(argb,1,1,1)color(0,0,0,0)";
		unitUnconscious = "#(argb,1,1,1)color(0,0,0,0)";
	};
};
