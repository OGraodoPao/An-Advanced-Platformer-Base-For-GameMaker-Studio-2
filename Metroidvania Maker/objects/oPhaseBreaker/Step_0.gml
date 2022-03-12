
// Sets the phase break to true
global.phasebreak = phase_tick < phase_cooldown;

phase_tick++;

if (mouse_check_button_pressed(mb_left))
{
	phasebreak(0.25 * room_speed);
	shake_camera(3, 3, 1);
}