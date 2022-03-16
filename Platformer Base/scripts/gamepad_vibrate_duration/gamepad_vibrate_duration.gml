// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gamepad_vibrate_duration(left_motor, right_motor, duration)
{
	with (oGamepadController)
	{
		stop_tick = 0;
		stop_vibrating_in = duration;
	}
	
	gamepad_set_vibration(0, left_motor * global.timefactor, right_motor * global.timefactor);
}