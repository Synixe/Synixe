class CfgVehicles {
  class Logic;
  class Module_F: Logic {
    class ModuleDescription {
      class AnyPlayer;
      class AnyBrain;
      class EmptyDetector;
    };
  };

  class GVAR(Module_Base): Module_F {
    mapSize = 1;
    author = "Brett";
    vehicleClass = "Modules";
    category = "SYNIXE_ZEUS";

    scope = 1;
    scopeCurator = 1;

    displayName = "Synixe Zeus Module Base";

    function = "";
    functionPriority = 1;
    isGlobal = 2;
    isTriggerActivated = 0;
    isDisposable = 0;

    class Arguments {};
    class ModuleDescription: ModuleDescription {
      description = "Synixe Zeus Module Base";
    };
  };

  class GVAR(Module_EndScenario): GVAR(Module_Base) {
    scopeCurator = 2;
    displayName = "End Scenario";
    curatorInfoType = QGVAR(RscEndScenario);
  };
};
