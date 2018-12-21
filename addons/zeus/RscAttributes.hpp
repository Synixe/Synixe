class RscControlsGroupNoScrollbars;
class RscText;
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

class GVAR(RscEndScenario): RscDisplayAttributes {
  onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(RscEndScenario))] call EFUNC(common,zeusAttributes));
  onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(RscEndScenario))] call EFUNC(common,zeusAttributes));
  class Controls: Controls {
    class Background: Background {};
    class Title: Title {};
    class Content: Content {
      class Controls {
        class EndScenario: RscControlsGroupNoScrollbars {
          onSetFocus = QUOTE(_this call FUNC(ui_endScenario));
          idc = 92854;
          x = 0;
          y = 0;
          w = W_PART(26);
          h = H_PART(2.1);
          class controls {
            class TitleLabel: RscText {
              idc = -1;
              text = CSTRING(ModuleEndScenario_Title);
              tooltip = CSTRING(ModuleEndScenario_Title_tooltip);
              x = 0;
              y = 0;
              w = W_PART(10);
              h = H_PART(1);
              colorBackground[] = {0, 0, 0, 0.5};
            };
            class Title: RscEdit {
              idc = 92855;
              x = W_PART(10.1);
              y = 0;
              w = W_PART(15.9);
              h = H_PART(1);
              autocomplete = "";
            };
            class SubtitleLabel: TitleLabel {
              text = CSTRING(ModuleEndScenario_Subtitle);
              tooltip = CSTRING(ModuleEndScenario_Subtitle_tooltip);
              y = H_PART(1.1);
            };
            class Subtitle: RscEdit {
              idc = 92856;
              x = W_PART(10.1);
              y = H_PART(1.1);
              w = W_PART(15.9);
              h = H_PART(1);
              autocomplete = "";
            };
          };
        };
      };
    };
    class ButtonOK: ButtonOK {};
    class ButtonCancel: ButtonCancel {};
  };
};
