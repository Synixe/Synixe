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
    category = "SYNIXE_SPECTATOR";

    scope = 1;
    scopeCurator = 1;

    displayName = "Synixe Spectator Module Base";

    function = "";
    functionPriority = 1;
    isGlobal = 2;
    isTriggerActivated = 0;
    isDisposable = 0;

    class Arguments {};
    class ModuleDescription: ModuleDescription {
      description = "Synixe Spectator Module Base";
    };
  };

  class GVAR(Module_RespawnPlayer): GVAR(Module_Base) {
    scopeCurator = 2;
    displayName = "Respawn";
    curatorInfoType = QGVAR(RscRespawnPlayer);
  };
  class GVAR(Module_KillPlayer): GVAR(Module_Base) {
    scopeCurator = 2;
    displayName = "Kill";
    function = QFUNC(moduleKillPlayer);
  };
};
