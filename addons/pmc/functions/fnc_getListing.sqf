params ["_class"];

private _ret = _class;

// Check for shop listing
private _shopClass = configFile >> "SynixeShop" >> _class;
if (isClass _shopClass) exitWith {
	_class
};

// Check for non-pip
private _parents = [configFile >> "CfgWeapons" >> _class, true] call BIS_fnc_returnParents;
if (count _parents > 2) then {
	private _shopClass = configFile >> "SynixeShop" >> (_parents select 1);
	if (isClass _shopClass) then {
		_ret = (_parents select 1);
	};
};

// Check for MRT next scope
private _nextClass = configFile >> "CfgWeapons" >> _class >> "MRT_SwitchItemNextClass";
if (isText (_nextClass)) then {
	private _next = getText _nextClass;
	private _shopClass = configFile >> "SynixeShop" >> _next;
	if (isClass _shopClass) then {
		_ret = _next;
	};
};

_ret
