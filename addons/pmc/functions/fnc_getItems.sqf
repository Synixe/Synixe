private _items = [];

{
	private _class = configName _x;
	_items pushBack _class;
} forEach configProperties [configFile >> "SynixeShop", "true", true];

_items
