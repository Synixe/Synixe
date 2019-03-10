/*
 * Author: Brett
 * Is the ace_player allowed to interact with the map of another unit
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Can Interact <BOOL>
 *
 * Example:
 * bob call synixe_maps_fnc_canMapInteract
 *
 * Public: No
 */

params ["_unit"];

!(alive _unit) || {(side _unit == side ace_player)}
