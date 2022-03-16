

#region debug toplines
if (show_debug_toplines)
{
    var i = 0; repeat (sprite_width - 1 / top_lineduction)
    {
        if (i mod top_lineduction == 0)
        {
            var hitting_block = collision_line(bbox_left + i, y, bbox_left + i, y - toplines_height, pSolid, false, false);
            var ycalc = y - toplines_height;
            
            var correction_avaliable = false;
            if (hitting_block)
            {
                var left_offset = point_distance(bbox_right, 0, hitting_block.bbox_left, 0);
                var right_offset = point_distance(bbox_left, 0, hitting_block.bbox_right, 0);
                
                if (left_offset < correct_offset or right_offset < correct_offset)
                {
                    correction_avaliable = true;
                }
            }
            
            var color = c_blue;
            
            // Sets color to purple if collision on top is hittable, but correction is avaliable, and turns red if there is no correction avaliable
            if (hitting_block != noone)
            {
                if (correction_avaliable)
                {
                    color = c_purple;
                }
                else
                {
                    color = c_red;
                }
            }
            
            
            draw_line_color(bbox_left + i, y - 2, bbox_left + i, ycalc, color, c_black);
        }
        i++;
    }
}
#endregion

#region debug downlines
if (show_debug_downlines)
{
    var i = 0; repeat (sprite_width - 1)
    {
        if (i mod down_linereduction == 0)
        {
            
            var hitting_block = collision_line(bbox_left + i, y, bbox_left + i, y + downlines_height, pSolid, false, false);
            var ycalc = y + downlines_height;
            
            var correction_avaliable = false;
            if (hitting_block)
            {
                var left_offset = point_distance(bbox_right, 0, hitting_block.bbox_left, 0);
                var right_offset = point_distance(bbox_left, 0, hitting_block.bbox_right, 0);
                
                if (left_offset < correct_offset or right_offset < correct_offset)
                {
                    correction_avaliable = true;
                }
            }
            
            var color = c_blue;
            
            // Sets color to purple if collision on top is hittable, but correction is avaliable, and turns red if there is no correction avaliable
            if (hitting_block != noone)
            {
                if (correction_avaliable)
                {
                    color = c_purple;
                }
                else
                {
                    color = c_red;
                }
            }
            
            draw_line_color(bbox_left + i, y - 2, bbox_left + i, ycalc, color, c_black);
        }
        
        i++;
    }
}
#endregion

if (show_coyote_bar and !place_meeting(x, y + 1, pSolid) and coyote_time > 0)
{
    var backc = c_white;
    draw_rectangle_color(bbox_left, bbox_top - 5, bbox_left + sprite_width * (coyote_time / coyote_time_max), bbox_top - 10, backc, backc, coyote_time == coyote_time_max ? backc : c_red, coyote_time == coyote_time_max ? backc : c_red, false);

    draw_rectangle_color(bbox_left, bbox_top - 5, bbox_right, bbox_top - 10, backc, backc, backc, backc, true);
    
}

if (show_space_press_input)
{
    var jump_press = keyboard_check_pressed(vk_space);
    var jump_held = keyboard_check(vk_space)
    var jump_released = keyboard_check_released(vk_space);
    
    space_press_fade = lerp(space_press_fade, 0, 0.1);
    space_hold_fade = lerp(space_hold_fade, 0, 0.1);
    space_release_fade = lerp(space_release_fade, 0, 0.1);
    
    if (jump_press) space_press_fade = 1;
    if (jump_held) space_hold_fade = 1;
    if (jump_released) space_release_fade = 1;
    
    draw_set_color(c_black);
    draw_set_alpha((space_hold_fade + queue_jump_fade) / 1.1);
    draw_rectangle(oPlayer.bbox_right + 5, oPlayer.y + 0, oPlayer.bbox_right + string_width("Space released") / 1.5, oPlayer.y + 40, false)
    
    draw_set_color(c_white);
    
    draw_set_alpha(space_press_fade);
    draw_text_transformed(oPlayer.bbox_right + 5, oPlayer.y + 0, "Space pressed", 0.5, 0.5, 0)
    
    draw_set_alpha(space_hold_fade);
    draw_text_transformed(oPlayer.bbox_right + 5, oPlayer.y + 10, "Space holding", 0.5, 0.5, 0)
    
    draw_set_alpha(space_release_fade);
    draw_text_transformed(oPlayer.bbox_right + 5, oPlayer.y + 20, "Space released", 0.5, 0.5, 0)
    
    draw_set_alpha(space_release_fade);
    draw_text_transformed(oPlayer.bbox_right + 5, oPlayer.y + 20, "Space released", 0.5, 0.5, 0)
    
    queue_jump_fade = lerp(queue_jump_fade, queue_jump, 0.3);
    draw_set_alpha(queue_jump_fade);
    draw_text_transformed(oPlayer.bbox_right + 5, oPlayer.y + 30, "Jump in queue", 0.5, 0.5, 0)
    
    draw_set_alpha(1);
}

// Draws itself
draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(face_dir), draw_yscale * sign(image_yscale), image_angle, image_blend, image_alpha);
