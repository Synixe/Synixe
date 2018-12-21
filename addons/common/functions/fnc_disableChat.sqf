/*
 * Author: Brett
 * Disable Arma 3 Channels
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call synixe_common_fnc_disableChat
 *
 * Public: Yes
 */

//Disable chat
0 enableChannel [true, false];  //Global - Text Only
1 enableChannel false;          //Side
2 enableChannel false;          //Command
3 enableChannel false;          //Group
4 enableChannel false;          //Vehicle
5 enableChannel false;          //Direct
setCurrentChannel 0;            //Change to Global
