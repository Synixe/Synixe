#include "script_component.hpp"

// Tell server to fetch loadout
[0, {
	private _loadout = (EXT callExtension ["get_loadout", [getPlayerUID _this]]) select 0;
	if !(_loadout isEqualTo ":NOTFOUND") then {
		[QGVAR(setLoadout), [call compile _loadout], _this] call CBA_fnc_targetEvent;
	};
}, player] call CBA_fnc_globalExecute;

[QGVAR(setLoadout), {
	_this params [["_loadout", []]];
	INFO_1("Setting loadout: %1", _loadout);
	player setUnitLoadout [_loadout, false];
	systemChat " - loadout";
}] call CBA_fnc_addEventHandlerArgs;

call FUNC(db_pull);

[QGVAR(synced), {
	[GVAR(owned)] call CBA_fnc_deleteNamespace;
	GVAR(owned) = call CBA_fnc_createNamespace;
	{
		GVAR(owned) setVariable [_x select 0, _x select 1];
	} forEach (player getVariable [QGVAR(owned), []]);

	// Refresh Arsenals
	private _items = call FUNC(getItems);
	{
		[_x, true, false] call ace_arsenal_fnc_removeVirtualItems;
		[_x, _items] call ace_arsenal_fnc_initBox;
	} forEach GVAR(boxes);
}] call CBA_fnc_addEventHandler;
