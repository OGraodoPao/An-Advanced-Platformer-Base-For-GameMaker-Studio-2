
if (life_tick >= life_time) instance_destroy();
life_tick++;

if (move_chance >= random_range(0, 1)) y -= pixel_size;