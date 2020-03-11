params ["_unit", "_instigator"];

private _varName = format ["synixe-watchdog-%1", name _instigator];

private _last = _unit getVariable [_varName, 0];
if ((time - _last) < 2) exitWith {};

"synixe" callExtension [
	"watchdog", 
	[format [
		"%1 was injured by %2",
		name _unit,
		name _instigator
	]]
];

_unit setVariable [_varName, time];
