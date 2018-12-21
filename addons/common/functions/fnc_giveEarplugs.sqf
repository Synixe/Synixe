/*
 * Author: Brett
 * Give ACE_EarPlugs to a unit if they don't already have them
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call synixe_common_fnc_giveEarplugs
 *
 * Public: Yes
 */

if !("ACE_EarPlugs" in (items _this)) then {
  _this addItem "ACE_EarPlugs";
};
