systemChat "Creating Zeus Modules";
0 spawn {
  private _needAdmin = true;
  private _needCurator = true;
  private _needZeus = true;
  private _needHeadless = true;

  private _objects = allMissionObjects "";
  {
    switch (typeOf _x) do {
      case "ModuleCurator_F": {
        private _owner = (_x get3DENAttribute "ModuleCurator_F_Owner") select 0;
        if (_owner == "#adminLogged") then {
          _needAdmin = false;
        };
        if (_owner == "curator") then {
          _needZeus = false;
        };
      };
      case "VirtualCurator_F": {
        private _name = (_x get3DENAttribute "name") select 0;
        if (_name == "curator") then {
          _needCurator = false;
        };
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
    systemChat "-- Creating Admin Zeus";
    private _module = create3DENEntity ["Logic", "ModuleCurator_F", [0, 0, 0]];
    _module set3DENAttribute ["ModuleCurator_F_Owner", "#adminLogged"];
  };

  if (_needCurator) then {
    // Create Curator Zeus
    systemChat "-- Creating Virtual Curator";
    private _module = create3DENEntity ["Logic", "VirtualCurator_F", [0, 0, 0]];
    _module set3DENAttribute ["name", "curator"];
    _module set3DENAttribute ["ControlSP", false];
    _module set3DENAttribute ["ControlMP", true];
    _module set3DENAttribute ["description", "Game Master"];
  };

  if (_needZeus) then {
    // Create Curator Zeus
    systemChat "-- Creating Curator Zeus";
    private _module = create3DENEntity ["Logic", "ModuleCurator_F", [0, 0, 0]];
    _module set3DENAttribute ["ModuleCurator_F_Owner", "curator"];
  };

  if (_needHeadless) then {
    // Create Headless Client
    systemChat "-- Creating Headless Client";
    private _module = create3DENEntity ["Logic", "HeadlessClient_F", [0,0,0]];
    _module set3DENAttribute ["name", "trevor"];
  };

  systemChat "Done Creating Modules";
};
