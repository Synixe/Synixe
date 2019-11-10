#include "script_component.hpp"

params ["_display"];

if (getMissionConfigValue ["pmcEnabled", ""] isEqualTo "") exitWith {
	[_display] call ace_arsenal_fnc_buttonHide;
};

private _items = (getUnitLoadout player) call FUNC(listItems);
private _cost = [_items] call FUNC(buyItems);
[_items] call CBA_fnc_deleteNamespace;
systemChat format ["Spent %1", _cost];
["ace_arsenal_leftPanelFilled", [_display]] call CBA_fnc_localEvent;
["ace_arsenal_rightPanelFilled", [_display]] call CBA_fnc_localEvent;
