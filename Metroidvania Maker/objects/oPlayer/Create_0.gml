if (live_call()) return live_result;



// Movement settings
vspd = 0;
hspd = 0;

spd = 3;

grv = 0.3;

speed_buildup = 0.1;

jump_force = 7;

// Dynamic systems variables
respect_dynamic_jump = true;
coyote_time_max = 0.3 * room_speed; // In seconds
coyote_time = 0;

queue_jump = false;

ignore_collision_this_frame = false;

correct_offset = sprite_width * 0.3;

// Debug variables

show_debug_toplines = true;
top_lineduction = 2;
toplines_height = sprite_height * 5;

show_debug_downlines = true;
down_linereduction = 2;
downlines_height = sprite_height * 2;

show_coyote_bar = true;

show_space_press_input = true;

space_press_fade = 0;
space_hold_fade = 0;
space_release_fade = 0;
queue_jump_fade = 0;