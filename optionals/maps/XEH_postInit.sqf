#include "script_component.hpp"

if (isServer) then {
  [] spawn {
    [{time > 0},
      FUNC(serverSetup)
    ] call CBA_fnc_waitUntilAndExecute;
  }
};

if (hasInterface && {isMultiplayer}) then {
  [] spawn {
    [{time > 0 && !(isNull player)},
      FUNC(clientSetup)
    ] call CBA_fnc_waitUntilAndExecute;
  };
}