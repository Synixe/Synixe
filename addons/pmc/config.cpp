#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = QUOTE(COMPONENT);
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"synixe_main", "ace_arsenal"};
    author = "SynixeBrett";
    VERSION_CONFIG;
  };
};

#include "RscAttributes.hpp"
#include "CfgEventHandlers.hpp"

class SynixeShop {
	#include "shop\rifles.hpp"
	#include "shop\pistols.hpp"
	// #include "shop\mgs.hpp"
	#include "shop\smgs.hpp"
	
	#include "shop\uniforms.hpp"
	#include "shop\vests.hpp"
	#include "shop\backpacks.hpp"
	#include "shop\helmets.hpp"
	#include "shop\facewear.hpp"

	#include "shop\attachments.hpp"
	#include "shop\gear.hpp"
 	#include "shop\mags.hpp"
	#include "shop\throwables.hpp"

	#include "shop\roles\medic.hpp"
};
