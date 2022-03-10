// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function leave_from_wall()
{
	return false;
	var i = 1;
	
	var _x = x;
	var _y = y;
		
	// Checks the nearest empty space
	while (place_meeting(x, y, pSolid))
	{
		if (!place_meeting(x + i, y, pSolid)) _x = x + i;
		if (!place_meeting(x, y + i, pSolid)) _y = y + i;
		
		if (!place_meeting(x - i, y, pSolid)) _x = x - i;
		if (!place_meeting(x, y - i, pSolid)) _y = y - i;
		
		
		if (_x != x) x = _x;
		if (_y != y) y = _y;
		
		i++;
	}
}