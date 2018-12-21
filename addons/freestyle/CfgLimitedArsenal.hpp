class CfgLimitedArsenal {
  items[] = {
    "Binocular", "ItemGPS", "ItemCompass", "ItemWatch", "ACE_Altimeter", "ACE_filedDressing",
    "ACE_bloodIV", "ACE_bloodIV_250", "ACE_bloodIV_500", "ACE_CableTie", "ACE_epinephrine",
    "ACE_morphine", "ACE_EntrenchinTool", "ACE_EarPlugs", "ACE_IR_Strobe_Item", "ACE_MapTools",
    "ACE_Flashlight_XL50", "ACE_Tripod", "ToolKit", "ACE_wirecutter", "Chemlight_blue",
    "Chemlight_green", "ACE_Chemlight_HiOrange", "ACE_Chemlight_HiRed", "ACE_Chemlight_HiWhite",
    "ACE_Chemlight_HiYellow", "ACE_Chemlight_IR", "ACE_Chemlight_Orange", "ACE_Chemlight_White",
    "Chemlight_red", "Chemlight_yellow", "B_IR_Grenade", "SmokeShellBlue", "SmokeShellGreen",
    "SmokeShellOrange", "SmokeShellPurple", "SmokeShellRed", "SmokeShellYellow", "SmokeShell",
    "ace_acc_pointer_green", "acc_pointer_ir", "acc_flashlight", "bipod_01_f_blk", "bipod_01_f_mpt",
    "bipod_01_f_snd", "bipod_01_f_khk", "acc_flashlight_pistol"
  };
  class Optionals {
    class Suppressors {
      name = "Suppressors";
      items[] = {"muzzle_snds_l", "muzzle_snds_h", "muzzle_snds_b", "ace_muzzle_mzls_h"};
    };
    class NightVision {
      name = "Night Vision";
      items[] = {"NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP", "NVGogglesB_grn_F"};
    };
    class Rangefinders {
      name = "Rangefinders";
      items[] = {"Laserdesignatior", "Rangefinder", "Laserdesignatior_03", "ACE_Vector", "ACE_VectorDay"};
    };
    class Grenades {
      name = "Grenades";
      items[] = {"HandGrenade", "MiniGrenade", "ACE_M14"};
    };
    class FlashGrenades {
      name = "Flash Grenades";
      items[] = {"ACE_M84"};
    };
  };
  class Loadouts {
    class Canada {
      items[] = {"CAF_C8", "CAF_C9"};
      class Arid {
        name = "Canada (AR)";
        items[] = {"CAF_U_CombatFatigues_AR"};
      };
      class Temperate {
        name = "Canada (TW)";
        items[] = {"CAF_U_CombatFatigues_TW"};
      };
      class Winter {
        name = "Canada (WA)";
        items[] = {"CAF_U_CombatFatigues_WA"};
      };
    };
  };
};
