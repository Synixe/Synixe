#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = QUOTE(COMPONENT);
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"synixe_main", "A3_Data_F", "A3_Air_F_EPC_Plane_CAS_01", "A3_Air_F_Jets_Plane_Fighter_02"};
    author = "SynixeBrett";
    VERSION_CONFIG;
  };
};

#include "CfgPresets.hpp"
