class CfgVehicles {
  class Man;
  class CAManBase: Man {
    class ACE_Actions {
      class ACE_MainActions {
        class Synixe_Map {
          displayName = "Map";
          icon = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\map_off_ca.paa";
          condition = QUOTE((_target call FUNC(canMapInteract)) && {_target call FUNC(hasUniqueMap)});
          class Synixe_Map_Peek {
            displayName = "Peek";
            statement = QUOTE((_target call FUNC(getMap)) call FUNC(peek));
          };
          class Synixe_Map_Copy {
            displayName = "Copy Markers";
            statement = QUOTE((_target call FUNC(getMap)) call FUNC(copy));
          };
          class Synixe_Map_Take {
            displayName = "Take";
            condition = QUOTE(!(alive _target));
            statement = QUOTE(_target call FUNC(take));
          };
        };
      };
    };
    class ACE_SelfActions {
      class Synixe_Map {
        displayName = "Get Unique Map";
        icon = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\map_off_ca.paa";
        condition = QUOTE((""ItemMap"" in (assignedItems ace_player)) && { !(ace_player call FUNC(hasUniqueMap)) });
        statement = QUOTE(call FUNC(request));
      };
    };
  };
};