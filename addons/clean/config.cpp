#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"imrali", "imralispring", "K9S_Teumess", "APHX_Karia"};
        author = "AUTHOR";
        VERSION_CONFIG;
    };
};

#include "CfgWorlds.hpp"
