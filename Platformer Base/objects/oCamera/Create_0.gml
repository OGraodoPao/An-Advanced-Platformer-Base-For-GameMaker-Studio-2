
#region Camera
show_debug_overlay(true);

camera_speed = 5;

// Camera Setup
cam = view_camera[0];
cam_default_w = camera_get_view_width(cam);
cam_default_h = camera_get_view_height(cam);
//view_w_half = camera_get_view_width(cam) * 0.5;
//view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;
follow = oPlayer;

// Zooming
zoomLevel = 1;
temp_cam_w = cam_default_w;
temp_cam_h = cam_default_h;

// Mini rooms
miniroom = noone;

// Shaking
shake_length = 2;
shake_magnitude = 1;
shake_remain = 0;
buff = 0;
#endregion

// Debug
free_roam = false;

// Game feel
natural_movement_bounds = 10;
natural_movement_dir = 0;

curr_distance = 0;

curr_movement_x = 0;
curr_movement_y = 0;