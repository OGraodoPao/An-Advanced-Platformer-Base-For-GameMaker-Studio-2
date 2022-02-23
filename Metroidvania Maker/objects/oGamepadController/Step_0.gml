// Stops vibrating
if (stop_tick >= stop_vibrating_in)
{
	gamepad_set_vibration(0, 0, 0);
}

stop_tick++;