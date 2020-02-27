
private _needAdmin = true;
private _needHeadless = true;

private _needGameMasterEntity = true;

private _needSupervisorEntity = true;

private _objects = allMissionObjects "";
{
  switch (typeOf _x) do {
    case "ModuleCurator_F": {
      private _owner = (_x get3DENAttribute "ModuleCurator_F_Owner") select 0;
      if (_owner == "#adminLogged") then {
        _needAdmin = false;
      };
    };
    case "VirtualCurator_F": {
      private _name = (_x get3DENAttribute "name") select 0;
      if (_name == "curator") then {
        _needGameMasterEntity = false;
      };
      if (_name == "supervisor") then {
        _needSupervisorEntity = false;
      }
    };
    case "HeadlessClient_F": {
      private _name = (_x get3DENAttribute "name") select 0;
      if (_name == "trevor") then {
        _needHeadless = false;
      };
    };
  };
} forEach _objects;

if (_needAdmin) then {
  // Create Admin Zeus
  private _module = create3DENEntity ["Logic", "ModuleCurator_F", [0, 0, 0]];
  _module set3DENAttribute ["ModuleCurator_F_Owner", "#adminLogged"];
};

if (_needGameMasterEntity) then {
  // Create Curator Entity
  private _module = create3DENEntity ["Logic", "VirtualCurator_F", [0, 0, 0]];
  _module set3DENAttribute ["name", "curator"];
  _module set3DENAttribute ["ControlSP", false];
  _module set3DENAttribute ["ControlMP", true];
  _module set3DENAttribute ["description", "Game Master"];
};

if (_needSupervisorEntity) then {
  // Create Curator Entity
  private _module = create3DENEntity ["Logic", "VirtualCurator_F", [0, 0, 0]];
  _module set3DENAttribute ["name", "supervisor"];
  _module set3DENAttribute ["ControlSP", false];
  _module set3DENAttribute ["ControlMP", true];
  _module set3DENAttribute ["description", "Supervisor"];
};

if (_needHeadless) then {
  // Create Headless Client
  private _module = create3DENEntity ["Logic", "HeadlessClient_F", [0,0,0]];
  _module set3DENAttribute ["name", "trevor"];
};
