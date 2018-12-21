class ctrlMenuStrip;
class display3DEN {
  class Controls {
    class MenuStrip: ctrlMenuStrip {
      class Items {
        // Attributes
        class Attributes {
          items[] += {"SynixeAttributes"};
        };
        class SynixeAttributes {
          text = "Synixe Settings";
          action = "edit3DENMissionAttributes 'SynixeAttributes';";
          picture = "\z\synixe\addons\main\media\synixe_logo_transparent_ca.paa";
        };

        // Tools
        class Tools {
          items[] += {"Synixe_Tools"};
        };
        class Synixe_Tools {
          text = "Synixe";
          items[] += {"Synixe_Tool_SetupMission", "Synixe_Tool_CreateModules"};
        };
        class Synixe_Tool_SetupMission {
          text = "Set Mission Settings";
          action = QUOTE(call FUNC(setMissionSettings));
        };
        class Synixe_Tool_CreateModules {
          text = "Create Modules";
          action = QUOTE(call FUNC(createModules));
        };
      };
    };
  };
};
