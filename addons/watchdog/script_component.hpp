#define COMPONENT watchdog
#include "\z\synixe\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_WATCHDOG
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_WATCHDOG
    #define DEBUG_SETTINGS DEBUG_SETTINGS_WATCHDOG
#endif

#include "\z\synixe\addons\main\script_macros.hpp"
