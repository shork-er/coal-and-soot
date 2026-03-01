fade_alpha = 0;
fade_speed = 0.05; // Change this to make the fade faster or slower
fade_out = true;   // Starting by fading to black
target_sprite = noone;
depth = -10000;
var lay_id = layer_get_id("Background"); // Get the layer named "Background"
var back_id = layer_background_get_id(lay_id); // Get the background element on that layer
layer_background_sprite(back_id, target_sprite); // Set the sprite