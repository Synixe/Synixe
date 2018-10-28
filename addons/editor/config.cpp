#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = QUOTE(COMPONENT);
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"3DEN", "synixe_main"};
    author = "SynixeBrett";
    VERSION_CONFIG;
  };
};

#include "CfgEventHandlers.hpp"

#include "display3DEN.hpp"
class Cfg3DEN {
  class Mission {
    class SynixeAttributes {
      displayName = "Synixe";
      display = "Display3DENEditAttributesPreview";
      class AttributeCategories {};
    };
  };
};
