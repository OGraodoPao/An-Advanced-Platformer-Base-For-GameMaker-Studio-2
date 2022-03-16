// Stops vibrating
if (stop_tick * global.timefactor >= stop_vibrating_in * global.timefactor)
{
	gamepad_set_vibration(0, 0, 0);
}

stop_tick += global.timefactor;