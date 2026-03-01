// Draw a black rectangle over the entire screen
draw_set_color(c_black);
draw_set_alpha(fade_alpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1.0); // Reset alpha so other things draw correctly
// Draw Event of obj_fade
draw_set_color(c_black);
draw_set_alpha(fade_alpha);
// Use a giant number to ensure it covers any screen size
draw_rectangle(-1000, -1000, room_width + 1000, room_height + 1000, false);
draw_set_alpha(1);
draw_sprite(target_sprite, 0, x, y);