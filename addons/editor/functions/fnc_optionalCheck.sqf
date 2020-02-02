params [["_wait", 0]];

if (canSuspend) then {
	sleep _wait;
};

if (isClass(configFile >> "CfgPatches" >> "jsrs_soundmod_weapons")) then {
	["You have JSRS loaded, this mission will not be playable on the Synixe server", "Incompatible Mods", false] call BIS_fnc_3DENShowMessage;
};
