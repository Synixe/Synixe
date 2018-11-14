_this spawn {
private ["_win","_fade","_winPrevious","_playmusic","_completeTasks"];
_var = "synixe_end";
_end = "end1";
_win = _this param [1,true,[true]];
_fade = _this param [2,true,[true,0]];
_playmusic = _this param [3,true,[true]];
_completeTasks = _this param [4,false,[false]];

_winPrevious = missionnamespace getvariable ["BIS_fnc_missionHandlers_win",_win];
if (!_winPrevious && _win) exitwith {};

if !(isnil {BIS_fnc_endMission_effects}) then {terminate BIS_fnc_endMission_effects;};
BIS_fnc_endMission_effects = missionnamespace getvariable [_var,[] spawn {}];
missionnamespace setvariable [_var,nil];

if (typename _end == typename []) then {
_endName = _end param [0,"end",[""]];
_endID = _end param [1,1,[0]];
_end = _endName + "_" + str _endID;
};
if (_end == "") then {_end = "end1"};

if (typename _fade == typename true) then {
_fade = [0,-1] select _fade;
};
enablesaving [false,false];

missionnamespace setvariable ["BIS_fnc_missionHandlers_win",_win];
missionnamespace setvariable ["BIS_fnc_missionHandlers_end",_end];

if (_fade < 0) then {

_layerNoise = "BIS_fnc_endMission_noise" call bis_fnc_rscLayer;
_layerInterlacing = "BIS_fnc_endMission_interlacing" call bis_fnc_rscLayer;
_layerStatic = "BIS_fnc_endMission_static" call bis_fnc_rscLayer;
_layerEnd = "BIS_fnc_endMission_end" call bis_fnc_rscLayer;
{_x cuttext ["","plain"]} foreach [_layerNoise,_layerInterlacing,_layerStatic,_layerEnd];

if (_playmusic) then {
_musicvolume = musicvolume;
0.2 fademusic 0;
sleep 0.2;
_musicList = if (isnull curatorcamera) then {["EventTrack02_F_Curator","EventTrack01_F_Curator"]} else {["EventTrack02_F_Curator","EventTrack03_F_Curator"]};
playmusic (_musicList select _win);
0 fademusic _musicvolume;
sleep 0.4;
};

setacctime 1;
_layerStatic cutrsc ["RscStatic","plain"];

sleep 0.3;

showhud false;
RscMissionEnd_end = _end;
RscMissionEnd_win = _win;
_layerEnd cutrsc ["SynixeMissionEnd","plain"];

sleep 9;

RscNoise_color = [1,1,1,0];
_layerNoise cutrsc ["RscNoise","black"];
_layerStatic cutrsc ["RscStatic","plain"];

sleep 0.5;

RscNoise_color = [1,1,1,1];
_layerInterlacing cutrsc ["RscInterlacing","plain"];

2.5 fadesound 0;
2.5 fademusic 0;

sleep 2.5;

RscDisplayDebriefing_noise = true;
} else {
if (_fade > 0) then {
cuttext ["","black out",_fade];
sleep _fade;
};
};


[] call bis_fnc_forceEnd;

if ((missionNamespace getVariable ["BIS_fnc_endMission_checkAliveState",true]) && !ismultiplayer && !alive player) exitwith {
if (_fade >= 0) then {cuttext ["","plain"];};
};


if (_completeTasks) then {
{
if (tolower taskstate _x in ["created","assigned"]) then {_x settaskstate "canceled";};
} foreach simpletasks player;
};

if (_win) then {
["Mission completed with '%1' ending.",_end] call BIS_fnc_logFormat;

markasfinishedonsteam;
activateKey format ["BIS_%1.%2_done", missionName, worldName];
endmission _end;
} else {
["Mission failed with '%1' ending.",_end] call BIS_fnc_logFormat;

failmission _end;
};};
//missionnamespace setvariable [_var,_spawn];
