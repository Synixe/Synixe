#include "script_component.hpp"

if (!hasInterface) exitWith {0};

player call FUNC(giveEarplugs);

if (!isMultiplayer) exitWith {0};

call FUNC(disableChat);
