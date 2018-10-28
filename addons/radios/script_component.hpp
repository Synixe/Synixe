#define COMPONENT radios
#include "\z\synixe\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_RADIOS
  #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_RADIOS
  #define DEBUG_SETTINGS DEBUG_SETTINGS_RADIOS
#endif

#define RIFLEMAN_RADIO QUOTE(ACRE_PRC343)
#define SQUAD_RADIO QUOTE(ACRE_PRC148)
#define LONGRANGE_RADIO QUOTE(ACRE_PRC117F)

#define CHANNEL(number,desc) class Channel##number { description = QUOTE(desc); }

#include "\z\synixe\addons\main\script_macros.hpp"
