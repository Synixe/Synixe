#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = COMPONENT;
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_common", "cba_settings"};
    author = "SynixeBrett";
    VERSION_CONFIG;
  };
};

class RscStandardDisplay;
class RscControlsGroup;
class RscPictureKeepAspect;
class RscDisplayStart: RscStandardDisplay {
  class controls {
    class LoadingStart: RscControlsGroup {
      class controls {
        class Logo: RscPictureKeepAspect {
          text = "\z\synixe\addons\main\media\synixe_logo_transparent_ca.paa";
          onLoad = "";
        };
      };
    };
  };
};

class CfgWorlds {
  class CAWorld;

  class Gorgona: CAWorld {
    // Source: http://www.iten-online.ch/klima/europa/italien/cagliari.htm
    ACE_TempDay[]   = {14, 15, 17, 20, 23, 28, 31, 31, 28, 24, 19, 15};
    ACE_TempNight[] = {7, 7, 9, 10, 14, 18, 20, 20, 19, 15, 12, 8};
    // Source: https://weather-and-climate.com/average-monthly-Rainfall-Temperature-Sunshine,Cagliari,Sardinia
    ACE_Humidity[]  = {80, 78, 75, 72, 70, 68, 62, 62, 70, 72, 78, 80};

    //The data below is from Stratis, it should probably be changed at some point to more realistic values.

    // Source: https://weatherspark.com/averages/32194/Lemnos-Limnos-North-Aegean-Islands-Greece
    ACE_WindSpeedMax[]  = {{8.8, 5.5}, {8.8, 5}, {8.6, 4.8}, {7.6, 3.4}, {7.0, 3.0}, {7.1, 3.0}, {7.5, 3.1}, {8.0, 3.2}, {7.6, 3.5}, {7.8, 4.6}, {7.9, 5.0}, {8.2, 5.5}};
    ACE_WindSpeedMean[] = {4.8, 4.9, 4.6, 4.1, 3.5, 3.5, 4.3, 4.4, 4.1, 4.5, 4.5, 5.0};
    ACE_WindSpeedMin[]  = {{0.2, 5.0}, {0.1, 5.0}, {0.2, 4.3}, {0.0, 3.0}, {0.0, 2.1}, {0.0, 2.0}, {0.1, 3.1}, {0.3, 3.1}, {0.0, 3.6}, {0.0, 4.2}, {0.1, 5.0}, {0.2, 5.5}};
    // using the "Fraction of Time Spent with Various Wind Directions in (month)" graph
    ACE_WindDirectionProbabilities[]  = {{0.06, 0.32, 0.05, 0.04, 0.15, 0.06, 0.02, 0.02}, // January
                                         {0.08, 0.32, 0.04, 0.04, 0.18, 0.06, 0.02, 0.02}, // February
                                         {0.09, 0.30, 0.04, 0.04, 0.20, 0.06, 0.02, 0.03}, // March
                                         {0.10, 0.25, 0.03, 0.04, 0.22, 0.06, 0.02, 0.04}, // April
                                         {0.18, 0.25, 0.03, 0.04, 0.18, 0.04, 0.01, 0.05}, // May
                                         {0.25, 0.25, 0.03, 0.03, 0.15, 0.03, 0.00, 0.08}, // June
                                         {0.32, 0.30, 0.02, 0.02, 0.10, 0.01, 0.00, 0.09}, // July
                                         {0.28, 0.35, 0.02, 0.01, 0.08, 0.01, 0.00, 0.08}, // August
                                         {0.20, 0.37, 0.03, 0.01, 0.11, 0.01, 0.01, 0.05}, // September
                                         {0.10, 0.39, 0.04, 0.02, 0.15, 0.02, 0.01, 0.03}, // October
                                         {0.08, 0.38, 0.06, 0.04, 0.19, 0.03, 0.02, 0.02}, // November
                                         {0.06, 0.37, 0.05, 0.03, 0.18, 0.04, 0.02, 0.02}};// December
  };
};
