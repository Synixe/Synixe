#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = QUOTE(COMPONENT);
    units[] = {QGVAR(Module_RespawnPlayer), QGVAR(Module_KillPlayer)};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"synixe_main","ace_spectator"};
    author = "SynixeBrett";
    VERSION_CONFIG;
  };
};

#include "CfgEventHandlers.hpp"

class CfgFactionClasses {
  class NO_CATEGORY;
  class SYNIXE_SPECTATOR: NO_CATEGORY {
    displayName = CSTRING(SpectatorCategory);
  };
};

#include "CfgVehicles.hpp"
#include "RscAttributes.hpp"
