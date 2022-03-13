if (instance_exists(oParticle))
{
	// Draws particles
	with (oParticle)
	{
		draw_set_color(color);
	
		//draw_point(x, y);
		draw_rectangle(x - (pixel_size - 1), y - (pixel_size - 1), x, y, false);
	
		draw_set_color(c_white);
	}
}