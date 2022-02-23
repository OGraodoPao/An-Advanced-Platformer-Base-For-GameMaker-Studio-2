// Checks for button presses in a keyboard
if (keyboard_check(vk_anykey)) current_device = device.keyboard;

// Checks for button presses in a gamepad
if (gamepad_is_connected(0))
{
	if (gamepad_anykey(0, true)) current_device = device.gamepad;
}


if (current_device == 0)
{
	show_debug_message("Keyboard");
	
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	up = keyboard_check(ord("W"));
	down = keyboard_check(ord("S"));
	
	jump_press = keyboard_check_pressed(vk_space);
	jump_held = keyboard_check(vk_space);
	
	hspd = right - left;
	vspd = down - up;
	
}
else
{
	show_debug_message("Gamepad");
	
	var haxis = gamepad_axis_value(0, gp_axislh);
	var vaxis = gamepad_axis_value(0, gp_axislv);
	var dir = point_direction(0, 0, haxis, vaxis);
	
	
	jump_press = gamepad_button_check_pressed(0, gp_face1);
	jump_held = gamepad_button_check(0, gp_face1);
	//speed = point_distance(0 ,0, haxis, vaxis) * 5;
	
	hspd = haxis;
	vspd = vaxis;
}