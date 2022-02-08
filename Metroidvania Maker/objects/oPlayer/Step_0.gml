if (live_call()) return live_result;
//ignore_collision_this_frame = false;

if (keyboard_check_pressed(ord("R")))
{
    room_restart();
}

// Keybidings
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

var jump_press = keyboard_check_pressed(vk_space);
var jump_held = keyboard_check(vk_space);

var on_ground = place_meeting(x, y + 1, pSolid);
var next_to_ground = collision_line(x, y, x, y + sprite_height * 4, pSolid, false, false) != noone;

var hitting_block = collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_top + vspd, pSolid, false, false)//instance_place(x, y + vspd, pSolid);

show_debug_message(on_ground);

// If the player jumped on the wrong position while trying to get on top of a block, corrects the position
if (hitting_block != noone)
{
    
    var left_offset = point_distance(bbox_right, 0, hitting_block.bbox_left, 0);
    var right_offset = point_distance(bbox_left, 0, hitting_block.bbox_right, 0);
    
    // If both positions are valid for correction, checks the lowest one and uses it as base
    if (left_offset < correct_offset and right_offset < correct_offset)
    {
        if (left_offset < right_offset) 
        {
            right_offset = correct_offset + 1;
        }
        else
        {
            left_offset = correct_offset + 1;
        }
    }
    
    if (left_offset < correct_offset)
    {
        // Left position correction
        x = hitting_block.bbox_left - sprite_width / 2;
        //ignore_collision_this_frame = true;
    }
    else if (right_offset < correct_offset)
    {
        // Right position correction
        x = hitting_block.bbox_right + sprite_width / 2;
        //ignore_collision_this_frame = true;
    }

}

if (coyote_time > 0) coyote_time--;
// Resets needed variables while on ground
if (on_ground)
{
    respect_dynamic_jump = true;
    coyote_time = coyote_time_max;
}

if (queue_jump and on_ground)
{
    // Resets and jumps
    queue_jump = false;
    
    jump_press = true;
    jump_held = true;
}

// Movement and gravity
if (jump_press)
{
    if (on_ground or coyote_time > 0)
    {
        coyote_time = 0;
        vspd = -jump_force;
    }
    else if (next_to_ground)
    {
        // Sets jumping barely before touching the ground
        queue_jump = true;
    }
}

hspd = lerp(hspd, (right - left) * spd, speed_buildup);
vspd += grv;

// Clamps jumping and falling speed
if (respect_dynamic_jump)
{
    vspd = clamp(vspd, jump_held ? -jump_force : -jump_force + 4, 5);
}
else
{
    vspd = clamp(vspd, -jump_force - 4, 5);
}

//if (vspd <= -jump_force)

// Collisions
if (!ignore_collision_this_frame)
{
    if (place_meeting(x + hspd, y, pSolid))
    {
        while (!place_meeting(x + sign(hspd), y, pSolid))
        {
            x += sign(hspd);
        }
        hspd = 0;
    }
    
    if (place_meeting(x, y + vspd, pSolid))
    {
        while (!place_meeting(x, y + sign(vspd), pSolid))
        {
            y += sign(vspd);
        }
        vspd = 0;
    }
}

x += hspd;
y += vspd;