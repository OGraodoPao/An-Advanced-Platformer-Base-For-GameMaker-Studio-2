
// Gets the next coordinates
var _arrx = movement_points[current_point, 0];
var _arry = movement_points[current_point, 1];
	
// Calculates the next movement
var dir = point_direction(x, y, _arrx, _arry);
var last_movespeed = movement_speed;

// Checks if it will overshoot the next movement step
if (point_distance(x, y, _arrx, _arry) < movement_speed) 
{
	movement_speed = point_distance(x, y, _arrx, _arry);
}
	
var _movex = lengthdir_x(movement_speed, dir);
var _movey = lengthdir_y(movement_speed, dir);

// Moves
x += _movex;
y += _movey;

// Moves the player along if they're on top of this platform
if (place_meeting(x, y - 1, oPlayer))
{
	with (oPlayer)
	{
		if (!place_meeting(x + _movex, y + _movey, pSolid)) x += _movex;
		if (!place_meeting(x, y + _movey, pSolid)) y += _movey;
	}
}

// Checks if the final destination was reached
if (x == _arrx && y == _arry)
{
	// Changes the movement sense if needed
	if (current_point == array_length(movement_points) - 1)
	{
		sense = -1;
	}
	else if (current_point == 0)
	{
		sense = 1;
	}	
	current_point += sense;
}

// Returns movement speed to normal if changed
if (movement_speed != last_movespeed)
{
	movement_speed = last_movespeed;
}

show_debug_message(current_point);