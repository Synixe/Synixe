class CfgVehicles {
  class Logic;
  class Module_F: Logic {
    class ModuleDescription {
      class AnyPlayer;
      class AnyBrain;
      class EmptyDetector;
    };
  };

  class Synixe_Persistence_Module_Base: Module_F {
    mapSize = 1;
    author = "Brett";
    vehicleClass = "Modules";
    category = "SYNIXE_PERSISTENCE";

    scope = 1;
    scopeCurator = 1;

    displayName = "Synixe Persistence Module Base";

    function = "";
    functionPriority = 1;
    isGlobal = 2;
    isTriggerActivated = 0;
    isDisposable = 0;

    class Arguments {};
    class ModuleDescription: ModuleDescription {
      description = "Synixe Persistence Module Base";
    };
  };

  class Synixe_Persistence_Module_Save: Synixe_Persistence_Module_Base {
    scopeCurator = 2;
    function = QUOTE(FUNC(save));
    displayName = "Save State";
  };

  class Synixe_Persistence_Module_Load: Synixe_Persistence_Module_Base {
    scopeCurator = 2;
    function = QUOTE(FUNC(loadLive));
    displayName = "Load State";
  };
};
