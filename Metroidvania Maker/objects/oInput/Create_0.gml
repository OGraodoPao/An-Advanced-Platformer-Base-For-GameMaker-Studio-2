enum device
{
	keyboard,
	gamepad
}

current_device = device.keyboard;

// Inputs
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));

jump_press = keyboard_check_pressed(vk_space);
jump_held = keyboard_check(vk_space);

// Axis
hspd = 0;
vspd = 0;