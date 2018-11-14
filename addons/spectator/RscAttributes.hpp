class RscControlsGroupNoScrollbars;
class RscText;
class RscListbox;
class RscPicture;
class RscEdit;
class RscControlsGroup;
class RscCheckBox;

class RscDisplayAttributes {
  class Controls {
    class Background;
    class Title;
    class Content: RscControlsGroup {
      class controls;
    };
    class ButtonOK;
    class ButtonCancel;
  };
};

class GVAR(RscRespawnPlayer): RscDisplayAttributes {
  onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscRespawnPlayer))] call EFUNC(common,zeusAttributes));
  onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscRespawnPlayer))] call EFUNC(common,zeusAttributes));
  class Controls: Controls {
    class Background: Background {};
    class Title: Title {};
    class Content: Content {
      class Controls {
        class respawnPlayer: RscControlsGroupNoScrollbars {
          onSetFocus = QUOTE(_this call FUNC(ui_respawnPlayer));
          idc = 26422;
          x = 0;
          y = 0;
          w = W_PART(26);
          h = H_PART(8.1);
          class controls {
            class Title: RscText {
              idc = -1;
              text = CSTRING(ModuleRespawnPlayer);
              toolTip = CSTRING(ModuleRespawnPlayer_desc);
              x = 0;
              y = 0;
              w = W_PART(26);
              h = H_PART(1);
              colorBackground[] = {0, 0, 0, 0.5};
            };
            class Unit: RscListbox {
              idc = 16189;
              x = 0;
              y = H_PART(1.1);
              w = W_PART(26);
              h = H_PART(5.9);
            };
            class SearchBackground: RscText {
              idc = -1;
              x = 0;
              y = H_PART(7.1);
              w = W_PART(1);
              h = H_PART(1);
              colorBackground[] = {0, 0, 0, 0.5};
            };
            class SearchPicture: RscPicture {
              idc = -1;
              text = "\a3\Ui_f\data\GUI\RscCommon\RscButtonSearch\search_start_ca.paa";
              x = 0;
              y = H_PART(7.1);
              w = W_PART(1);
              h = H_PART(1);
            };
            class Search: RscEdit {
              idc = 16190;
              x = W_PART(1.2);
              y = H_PART(7.1);
              w = W_PART(14.5);
              h = H_PART(1);
              autocomplete = "";
            };
            class LabelGroup: Title {
              idc = -1;
              text = CSTRING(ModuleRespawnPlayer_loadout);
              toolTip = CSTRING(ModuleRespawnPlayer_loadout_desc);
              x = W_PART(15.9);
              y = H_PART(7.1);
              w = W_PART(9);
            };
            class KeepLoadout: RscCheckBox {
              idc = 16188;
              x = W_PART(25);
              y = H_PART(7.1);
              w = W_PART(1);
              h = H_PART(1);
            };
          };
        };
      };
    };
    class ButtonOK: ButtonOK {};
    class ButtonCancel: ButtonCancel {};
  };
};
