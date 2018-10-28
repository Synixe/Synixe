systemChat "Setting Up Mission";
0 spawn {
  systemChat "-- General";
  set3DENMissionAttributes [["Scenario", "EnableDebugConsole", 1]];
  systemChat "-- Multiplayer";
  set3DENMissionAttributes [["Multiplayer", "DisabledAI", true]];
  set3DENMissionAttributes [["Multiplayer", "Respawn", 2]];
  set3DENMissionAttributes [["Multiplayer", "RespawnButton", 0]];
  set3DENMissionAttributes [["Multiplayer", "RespawnTemplates", []]];
  set3DENMissionAttributes [["Multiplayer", "RespawnDialog", false]];
  systemChat "Done Setting Up Mission";
};
