
if (life_tick >= life_time * global.timefactor) instance_destroy();
life_tick += global.timefactor;

if (move_chance >= random_range(0, 1)) y -= pixel_size * global.timefactor;