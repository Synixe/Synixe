#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = QUOTE(COMPONENT);
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"cba_main", "synixe_main",
        "cfp_main",
        "caf2035_main",
        "A3_Aegis_Characters_F_Aegis",
        "GT_Mod", // Gendarmerie
        "FDF", // After East Wind
        "CUP_Creatures_People_Core",
        "CUP_Creatures_Military_USMC",
        "CFP_B_AFARMY",
        "CFP_B_USARMY_1991_DES",
        "CFP_B_USRANGERS_WDL",
        "CFP_B_USSEALS_DES",
        "CFP_O_ANSARALLAH",
        "CFP_O_IQARMY"
    };
    author = "SynixeBrett";
    VERSION_CONFIG;
  };
};

#include "CfgFactionClasses.hpp"
