#include "script_component.hpp"

// Tell server to fetch loadout
[0, {
	private _loadout = (EXT callExtension ["get_loadout", [getPlayerUID _this]]) select 0;
	if !(_loadout isEqualTo ":NOTFOUND") then {
	[QGVAR(setLoadout), [call compile _loadout], _this] call CBA_fnc_targetEvent;
	};
}, player] call CBA_fnc_globalExecute;

[QGVAR(setLoadout), {
	_this params ["_loadout"];
	INFO_1("Setting loadout: %1", _loadout);
	player setUnitLoadout [_loadout, false];
	systemChat " - loadout";
}] call CBA_fnc_addEventHandlerArgs;

// Tell server to fetch variables
[0, {
	private _variables = (EXT callExtension ["get_variables", [getPlayerUID _this]]) select 0;
	if !(_variables isEqualTo ":NOTFOUND") then {
	{
		_this setVariable [_x select 0, _x select 1, true];
	} forEach parseSimpleArray (_variables);
	[QGVAR(synced), [], _this] call CBA_fnc_targetEvent;
	};
}, player] call CBA_fnc_globalExecute;

[QGVAR(synced), {
	[GVAR(owned)] call CBA_fnc_deleteNamespace;
	GVAR(owned) = call CBA_fnc_createNamespace;
	{
		GVAR(owned) setVariable [_x select 0, _x select 1];
	} forEach (player getVariable [QGVAR(owned), []]);
}] call CBA_fnc_addEventHandler;
