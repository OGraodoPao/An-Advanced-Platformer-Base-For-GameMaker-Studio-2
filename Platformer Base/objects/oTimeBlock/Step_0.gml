if (distance_to_object(oPlayer) <= range)
{
	global.timefactor = clamp(distance_to_object(oPlayer) / range, 0.3, 1);
}