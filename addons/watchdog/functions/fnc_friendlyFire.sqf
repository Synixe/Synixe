params ["_unit", "_instigator"];

"synixe" callExtension [
	"watchdog", 
	format [
		"%1 was injured by %2",
		name _unit,
		name _instigator
	]
];
