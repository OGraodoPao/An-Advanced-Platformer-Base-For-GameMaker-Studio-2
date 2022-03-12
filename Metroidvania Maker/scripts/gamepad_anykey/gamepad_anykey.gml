// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gamepad_anykey(device, check_for_axis){
	
	var i = 0; repeat (gamepad_button_count(device))
	{
		if (gamepad_button_check(device, i) == true) return (true);
		
		if (check_for_axis)
		{
			// Analogs
			var haxis = gamepad_axis_value(device, gp_axislh);
			var vaxis = gamepad_axis_value(device, gp_axislv);
			var haxisrv = gamepad_axis_value(device, gp_axisrh);
			var vaxisrv = gamepad_axis_value(device, gp_axisrv);
		
			if (abs(haxis) + abs(vaxis) + abs(haxisrv) + abs(vaxisrv) >= 0.5) return (true);
		}
		
		i++;
	}
	
	
	
	
	return (false);
}