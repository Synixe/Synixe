/*
 * Author: Brett
 * Returns true if the provided map is unique
 *
 * Arguments:
 * 0: Map <STRING>
 *
 * Return Value:
 * Unique <BOOL>
 *
 * Example:
 * _map call synixe_maps_fnc_isUnique
 *
 * Public: No
 */

params ["_map"];

((toLower _map) find "synixe_map_") == 0
