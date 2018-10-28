/*
 * Author: Brett
 * Gets the display name of an item from CfgWeapons
 *
 * Arguments:
 * 0: Item <STRING> or <OBJECT>
 *
 * Return Value:
 * Display Name <STRING>
 *
 * Example:
 * _item call synixe_common_fnc_itemName
 *
 * Public: Yes
 */

params [["_item", ""]];

if (_item isEqualto "") exitWith { "" };

switch (typeName _item) do {
  case "OBJECT": { _item = className _item };
};

getText (configFile >> "CfgWeapons" >> _item >> "DisplayName")
