#define COMPONENT factions
#include "\z\synixe\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_FACTIONS
  #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FACTIONS
  #define DEBUG_SETTINGS DEBUG_SETTINGS_FACTIONS
#endif

#include "\z\synixe\addons\main\script_macros.hpp"

#define FNAME(base, dispName) class base; \
class base: base { \
	displayName = dispName; \
}
