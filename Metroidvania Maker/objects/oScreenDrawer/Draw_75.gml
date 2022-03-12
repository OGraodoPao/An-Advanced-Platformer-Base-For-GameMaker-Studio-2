// BLOOM SHADER

shader_set(shdr_bloom);
//shader_set_uniform_f(bloomIntensity, ((window_mouse_get_y()-250)/100)); //0 = off, 1 = a bit, 80 = extremely intense

shader_set_uniform_f(bloomIntensity, 0.25); //0 = off, 1 = a bit, 80 = extremely intense

//shader_set_uniform_f(bloomblurSize, ((window_mouse_get_x()-250)/1000)); // usually something like 1/512 (0.001)
shader_set_uniform_f(bloomblurSize, 1/512);
draw_surface(application_surface, 0, 0);
shader_reset();

// DEBUG OVERLAY

with (oPlayer)
{
	if (show_movement_stats)
	{
		draw_text(0, 0, "Coyote time: " + string(coyoteuse));
		draw_text(0, 15, "Queue jump: " + string(jumpqueueuse));
		draw_text(0, 30, "Player to platform bottom position correction: " + string(positioncorrectuse));
	}
}

// BLACK BOUNDS

// Black bounds around the screen

var _w = display_get_gui_width();
var _h = display_get_gui_height();

gpu_set_blendmode(bm_subtract);

draw_set_alpha(0.15);

draw_ellipse_color(-250, -250, _w + 250, _h + 250, c_black, make_color_rgb(100, 100, 100), false);

draw_set_alpha(1);

gpu_set_blendmode(bm_normal);


// AUTOSAVE
with (oSaveLoad)
{
	// Shows the saving icon if saving
	if (show_icon)
	{
		var _w = display_get_gui_width();
		var _h = display_get_gui_height();
	
		draw_sprite(sAutosave, save_frame, _w - sprite_get_width(sAutosave) / 2, _h - sprite_get_height(sAutosave) / 2)
	}

	save_frame += save_animation_speed;

	if (save_frame >= sprite_get_number(sAutosave)) 
	{
		show_icon = false;
	}
}