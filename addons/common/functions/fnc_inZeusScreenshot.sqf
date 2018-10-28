/*
 * Author: Brett
 * Returns true if the local player is in Zeus and in is in the screenshot mode
 *
 * Example:
 * _inScreenshot = call synixe_common_fnc_inZeusScreenshot
 *
 * Public: Yes
 */

#include "script_component.hpp"

if !(call FUNC(inZeus)) exitWith { false };

(ctrlFade ((findDisplay 312) displayCtrl 16810)) != 0;
