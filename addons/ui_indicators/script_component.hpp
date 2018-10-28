#define COMPONENT ui_indicators
#include "\z\synixe\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_UI_INDICATORS
  #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_UI_INDICATORS
  #define DEBUG_SETTINGS DEBUG_SETTINGS_UI_INDICATORS
#endif

#include "\z\synixe\addons\main\script_macros.hpp"

#define NIGHT_ALPHA 0.15
#define DAY_ALPHA 0.15
#define RADIUS 10
