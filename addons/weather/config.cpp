#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = COMPONENT;
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_common", "synixe_main"};
    author = "";
    authors[] = {"Brett"};
    authorUrl = "http://synixe.com";
    VERSION_CONFIG;
  };
};

#include "CfgEventHandlers.hpp"

class CfgWorlds {
  class CAWorld;

  class Winthera3: CAWorld {
    // Source: http://www.iten-online.ch/klima/europa/slowenien/maribor.htm
    ACE_TempDay[]   = {3, 5, 10, 15, 20, 23, 26, 25, 22, 15, 9, 5};
    ACE_TempNight[] = {-5, -5, -1, 4, 9, 12, 14, 13, 10, 5, 1, -2};
    // Source: https://weather-and-climate.com/average-monthly-Humidity-perc,bled,Slovenia
    ACE_Humidity[]  = {82, 79, 70, 69, 70, 69, 70, 75, 78, 82, 84, 85};

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

  class Thirsk: CAWorld {
    // Source: http://www.iten-online.ch/klima/europa/finnland/ivalo.htm
    ACE_TempDay[]   = {-10, -9, -3.5, 2, 8.6, 15.6, 18.4, 15.6, 9.4, 2.2, -4.1, -8.2};
    ACE_TempNight[] = {-19.2, -17.8, -13.5, -7.3, -0.1, 6.2, 9.1, 6.8, 2.4, -3.3, -11.1, -17.1};
    // Source: https://weather-and-climate.com/average-monthly-Rainfall-Temperature-Sunshine,Ivalo,Finland
    ACE_Humidity[]  = {82, 82, 80, 72, 68, 65, 70, 75, 82, 83, 85, 83};

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
  class ThirskW: CAWorld {
    // Source: http://www.iten-online.ch/klima/europa/finnland/ivalo.htm
    ACE_TempDay[]   = {-10, -9, -3.5, 2, 8.6, 15.6, 18.4, 15.6, 9.4, 2.2, -4.1, -8.2};
    ACE_TempNight[] = {-19.2, -17.8, -13.5, -7.3, -0.1, 6.2, 9.1, 6.8, 2.4, -3.3, -11.1, -17.1};
    // Source: https://weather-and-climate.com/average-monthly-Rainfall-Temperature-Sunshine,Ivalo,Finland
    ACE_Humidity[]  = {82, 82, 80, 72, 68, 65, 70, 75, 82, 83, 85, 83};

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
