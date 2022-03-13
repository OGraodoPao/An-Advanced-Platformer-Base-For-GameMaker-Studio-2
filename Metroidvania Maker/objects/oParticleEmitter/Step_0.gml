if (global.phasebreak) exit;

if (mouse_check_button_pressed(mb_left)) spawn_tick = 0; spawn_duration = 10;

// Spawns particles
if (spawn_tick < spawn_duration)
{
	var _negside = 0;
	var _posside = 0;
	
	var _h = 0; repeat(horizontal_rows)
	{
		if (spawn_chance >= random_range(0, 1))
		{
			continue;
			_h++;
		}
		
		// Checks the distance between particles to centralize the spawn to the emitter
		var _sense = _h mod 2 == 0 ? 1 : -1;
		
		_negside -= (_sense == -1) * pixel_size;
		
		if (_h != 0)
		{
			_posside += (_sense == 1) * pixel_size;
		}
		
		var part = instance_create_depth(x + (_sense == -1 ? _negside : _posside), y, depth - 1, oParticle);
		
		// Sets particles
		var _c = c_white;
		var _lt = 5;
		var _mc = 0.5;
		switch (particle_type)
		{
			case(part.dust):
				_c = c_white;
				_lt = irandom_range(0, 16);
				_mc = 0.6;
				break;
		}
		
		
		with (part)
		{
			color = _c;
			life_time = _lt;
			move_chance = _mc;
			
			pixel_size = other.pixel_size;
		}
		
		_h++;
	}
	
}
else
{
	if (destroy_after_emit) instance_destroy();
}

spawn_tick++;