// Zooms in and out with the scroll
var scroll = (mouse_wheel_down() - mouse_wheel_up()) * 0.1;
var ctrl = keyboard_check(vk_control);

var zw = cam_default_w * (zoomLevel + scroll) < room_width and cam_default_w * (zoomLevel + scroll) > 1;
var zh = cam_default_h * (zoomLevel + scroll) < room_height and cam_default_h * (zoomLevel + scroll) > 1;

if (free_roam)
{
	if (zw and zh and ctrl)
	{
		zoomLevel += scroll;
	}
}

if (free_roam)
{
	var right = keyboard_check(ord("D")) or keyboard_check(vk_right);
	var left = keyboard_check(ord("A")) or keyboard_check(vk_left);
	var up = keyboard_check(ord("W")) or keyboard_check(vk_up);
	var down = keyboard_check(ord("S")) or keyboard_check(vk_down);

	xTo += (right - left) * camera_speed + curr_movement_x;
	yTo += (down - up) * camera_speed + curr_movement_y;
}
else
{
	xTo = (follow.bbox_left + follow.sprite_width / 2) + curr_movement_x;
	yTo = (follow.bbox_top + follow.sprite_height /2) + curr_movement_y;
}


// Update view size
zoomXTo = cam_default_w * zoomLevel;
zoomYTo = cam_default_h * zoomLevel;
temp_cam_w += (zoomXTo - camera_get_view_width(cam)) / 16;
temp_cam_h += (zoomYTo - camera_get_view_height(cam)) / 16;

// Limits the zoom size
temp_cam_w = clamp(temp_cam_w, 0, room_width);
temp_cam_h = clamp(temp_cam_h, 0, room_height);

var temp_cam_w_half = temp_cam_w/2;
var temp_cam_h_half = temp_cam_h/2;
camera_set_view_size(cam, temp_cam_w, temp_cam_h);


// Keep within room or miniroom
var initx = buff;
var inity = buff;
var endx = room_width - buff;
var endy = room_height - buff;

if  (miniroom != noone)
{
	initx = miniroom.x + buff;
	inity = miniroom.y + buff;
	endx = miniroom.x + miniroom.sprite_width - buff;
	endy = miniroom.y + miniroom.sprite_height - buff;	
}

xTo = clamp(xTo, initx + temp_cam_w_half, endx -temp_cam_w_half);
yTo = clamp(yTo, inity  + temp_cam_h_half, endy -temp_cam_h_half);

// Camera shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));

// Update object position
x += (xTo - x) / 10;
y += (yTo - y) / 10;

// Update camera view
camera_set_view_pos(cam, x-temp_cam_w_half, y-temp_cam_h_half);

var _w = temp_cam_w_half * 3;
var _h = temp_cam_h_half * 3;

//deactick++;

//// Natural movement
//natural_movement_dir += random_range(-2, 2);
//curr_distance = clamp(curr_distance + choose(0.05, -0.05), 0, natural_movement_bounds);

//curr_movement_x = lengthdir_x(curr_distance, natural_movement_dir);
//curr_movement_y = lengthdir_y(curr_distance, natural_movement_dir);

//// Deactivates all surrounding blocks and activates the ones in camera view
//if (deactick > deactcooldown)	
//{
//	deactick = 0;
//	instance_deactivate_object(pSolid);
//	instance_activate_region(x - _w, y - _h, x + _w, y + _h, true);
//}
