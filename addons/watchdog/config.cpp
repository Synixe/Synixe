#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"synixe_main"};
        author = "SynixeBrett";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
