#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = QUOTE(COMPONENT);
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {};
    author = "SynixeBrett";
    VERSION_CONFIG;
  };
};

#include "CfgEventHandlers.hpp"
#include "ACRE.hpp"

class Cfg3DEN {
  class Mission {
    class SynixeAttributes {
      class AttributeCategories {
        class SynixeRadiosCategory {
          displayName = "Radios";
          class Attributes {
            class SynixeRadioReceive {
              displayName = "Receive Radios";
              tooltip = "If checked, all players will receive the standard radios";
              control = "Checkbox";
              property = QGVAR(receiveStandard);
              defaultValue = "true";
              expression = "";
            };
            class SynixeRadioPreset {
              displayName = "Radio Preset";
              property = QGVAR(preset);
              control = "Edit";
              tooltip = "ACRE Radio Preset";
              expression = "";
              typeName = "STRING";
              validate = "none";
              defaultValue = """standard""";
            };
            class SynixeRadioSingleSquad {
              displayName = "Single Squadnet";
              property = QGVAR(singleSquadnet);
              control = "Checkbox";
              tooltip = "All 148s will start on the same channel";
              defaultValue = "false";
              expression = "";
            };
          };
        };
      };
    };
  };
};
