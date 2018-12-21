{
  private _faction = (findDisplay 312) displayCtrl _x;
  if (ctrlShown _faction) exitWith {switch (_x) do {
    case (275);
    case (270): {
      "bluefor"
    };
    case (276);
    case (271): {
      "opfor"
    };
    case (277);
    case (272): {
      "indep"
    };
    case (278);
    case (273): {
      "civ"
    };
    case (279);
    case (274): {
      "empty"
    };
  }};
} forEach [270, 271, 272, 273, 274, 275, 276, 277, 278, 279];
