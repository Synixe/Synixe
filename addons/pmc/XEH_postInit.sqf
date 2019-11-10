#include "\z\ace\addons\arsenal\defines.hpp"

#include "script_component.hpp"

[{
	private _id = getMissionConfigValue ["pmcEnabled", ""];
	if !(_id == "true") exitWith {};

	// Server side only
	if (isServer) then {
		EXT callExtension "setup";
		INFO("setup complete");

		// save player loadouts on disconnect
		addMissionEventHandler ["HandleDisconnect", {
			params ["_unit", "_id", "_uid", "_name"];
			[_unit] call FUNC(savePlayer);
		}];
	};

	// Don't run on HC
	if !(hasInterface) exitWith {};

	systemChat "Enabling PMC Persistent System";

	// Tell server to fetch loadout
	[0, {
      private _loadout = (EXT callExtension ["get_loadout", [getPlayerUID _this]]) select 0;
      if !(_loadout isEqualTo ":NOTFOUND") then {
        [QGVAR(setLoadout), [parseSimpleArray (call compile _loadout)], _this] call CBA_fnc_targetEvent;
      };
    }, player] call CBA_fnc_globalExecute;

	[QGVAR(setLoadout), {
		_this params ["_loadout"];
		INFO_1("Setting loadout: %1", _loadout);
		player setUnitLoadout _loadout;
		systemChat " - loadout";
	}] call CBA_fnc_addEventHandlerArgs;

	// Tell server to fetch variables
	[0, {
      private _variables = (EXT callExtension ["get_variables", [getPlayerUID _this]]) select 0;
      if !(_variables isEqualTo ":NOTFOUND") then {
        {
          _this setVariable [_x select 0, call compile (_x select 1), true];
        } forEach parseSimpleArray (_variables);
		[QGVAR(synced), [], _this] call CBA_fnc_targetEvent;
      };
    }, player] call CBA_fnc_globalExecute;

	[QGVAR(synced), {
		[GVAR(owned)] call CBA_fnc_deleteNamespace;
		GVAR(owned) = call CBA_fnc_createNamespace;
		{
			GVAR(owned) setVariable [_x select 0, _x select 1];
		} forEach parseSimpleArray (player getVariable [QGVAR(owned), []]);
	}] call CBA_fnc_addEventHandler;

	// Save the loadout every time it changes, except in the arsenal
	["loadout", {
		if (time > 5 && {GVAR(arsenalClosed)}) then {
			[player] call FUNC(db_savePlayer);
		};
	}] call CBA_fnc_addPlayerEventHandler;

	GVAR(balance) = 2000;

	GVAR(owned) = call CBA_fnc_createNamespace;

	player setVariable [QGVAR(inArsenal), true, true];

	// Price stat
	[[[0,1,2,3,4,5,6,7,8], [0,1,2,3,4,5,6,7]], QGVAR(price), [], "Price", [false, true], [{}, {
		params ["_statsArray", "_itemCfg"];
		private _path = (str _itemCfg) splitString "/";
		[_path select ((count _path) - 1)] call FUNC(getPrice)
	}, {true}]] call ACE_arsenal_fnc_addStat;

	// Owned stat
	[[[0,1,2,3,4,5,6,7,8], [0,1,2,3,4,5,6,7]], QGVAR(owned), [], "Owned", [false, true], [{}, {
		params ["_statsArray", "_itemCfg"];
		private _path = (str _itemCfg) splitString "/";
		[_path select ((count _path) - 1)] call FUNC(getOwned)
	}, {true}]] call ACE_arsenal_fnc_addStat;

	["ace_arsenal_displayOpened", {
		params ["_display"];
		player setVariable [QGVAR(inArsenal), false, true];
		GVAR(preLoadout) = getUnitLoadout player;
		// Send an empty loadout to the database
		[0, {
			params ["_unit"];
			EXT callExtension ["save_loadout", [getPlayerUID _unit, [[],[],[],[],[],[],"","",[],["","","","","",""]]]];
		}, player] call CBA_fnc_globalExecute;
		// Store carried items
		private _items = (getUnitLoadout player) call FUNC(listItems);
		private _cost = [_items] call FUNC(addOwned);
		[_items] call CBA_fnc_deleteNamespace;
		GVAR(balanceHandle) = [{
			params ["_args"];
			_args params ["_display"];
			private _btnHide = _display displayCtrl IDC_buttonHide;
			private _btnClose = _display displayCtrl IDC_menuBarClose;
			private _items = (getUnitLoadout player) call FUNC(listItems);
			private _cost = [_items] call FUNC(itemsCost);
			[_items] call CBA_fnc_deleteNamespace;
			if (_cost == 0) then {
				_btnHide ctrlEnable false;
				_btnHide ctrlSetText format ["Balance: %1", GVAR(balance)];
				_btnHide ctrlSetTooltip "Current PMC Balance";
				_btnClose ctrlSetText "Apply";
			} else {
				if (_cost > GVAR(balance)) then {
					_btnHide ctrlEnable false;
				} else {
					_btnHide ctrlEnable true;
				};
				_btnHide ctrlSetText format ["Purchase: %1 / %2", _cost, GVAR(balance)];
				_btnHide ctrlSetTooltip "Buy Current Gear";
				_btnClose ctrlSetText "Cancel";
			};
		}, 0.2, [_display]] call CBA_fnc_addPerFrameHandler;
	}] call CBA_fnc_addEventHandler;

	["ace_arsenal_displayClosed", {
		[GVAR(balanceHandle)] call CBA_fnc_removePerFrameHandler;
		private _items = (getUnitLoadout player) call FUNC(listItems);
		private _cost = [_items] call FUNC(itemsCost);
		[_items] call CBA_fnc_deleteNamespace;
		if (_cost == 0) then {
			// Take carried items
			private _items = (getUnitLoadout player) call FUNC(listItems);
			private _cost = [_items] call FUNC(takeOwned);
			[_items] call CBA_fnc_deleteNamespace;
		} else {
			player setUnitLoadout [GVAR(preLoadout), false];
		};
		player setVariable [QGVAR(inArsenal), true, true];
		[player] call FUNC(sync);
	}] call CBA_fnc_addEventHandler;

	["ace_arsenal_leftPanelFilled", {
		params ["_display"];
		private _ctrlPanel = _display displayCtrl IDC_leftTabContent;
		for "_lbIndex" from 0 to (lbSize _ctrlPanel - 1) do {
			private _class = _ctrlPanel lbData _lbIndex;
			if ([_class] call FUNC(getOwned) > 0) then {
				_ctrlPanel lbSetColor [_lbIndex, [0, 1, 0, 1]];
				_ctrlPanel lnbSetColor [_lbIndex, [0, 1, 0, 1]];
			};
		};
	}] call CBA_fnc_addEventHandler;

	["ace_arsenal_rightPanelFilled", {
		params ["_display"];
		private _ctrlPanel = _display displayCtrl IDC_rightTabContent;
		for "_lbIndex" from 0 to (lbSize _ctrlPanel - 1) do {
			private _class = _ctrlPanel lbData _lbIndex;
			if ([_class] call FUNC(getOwned) > 0) then {
				_ctrlPanel lbSetColor [_lbIndex, [0, 1, 0, 1]];
			};
		};
	}] call CBA_fnc_addEventHandler;

	systemChat "Persistent System Enabled";
}, {}, 1] call CBA_fnc_waitAndExecute;
