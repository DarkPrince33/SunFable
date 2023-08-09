// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrPlayer(){
var _left = keyboard_check(ord("A")) || keyboard_check(vk_left);
var _right = keyboard_check(ord("D")) || keyboard_check(vk_right);

var _move = _right - _left;


_hsp = _move * _player_spd;

_vsp += _grv;


var _run = keyboard_check(vk_shift);

if _run{
	_player_spd = 2
	_player_walk_spr = sSolRun
} else {
	_player_spd = _def_player_spd	
	_player_walk_spr = _def_player_walk_spr
}
if (_hsp != 0){
	
	sprite_index = _player_walk_spr
	
	if (_hsp != 0) image_xscale = sign(_hsp);
	
} else {
	sprite_index = sSolBreath
}



if (place_meeting(x + _hsp,y,oWall)){
	
	while (!place_meeting(x + sign(_hsp),y,oWall))
	{
		
		x += sign(_hsp);
	
	}
	_hsp = 0;
	
}

x += _hsp;




if (place_meeting(x,y + _vsp,oWall)){
	
	while (!place_meeting(x,y + sign(_vsp),oWall))
	{
		
		y += sign(_vsp);
	
	}
	_vsp = 0;
	
}

y += _vsp;


var _jump = keyboard_check_pressed(vk_space);

if (place_meeting(x,y + 1,oWall)) && (_jump){
	
		_vsp = -7;
		
}	

}