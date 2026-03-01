if (fade_out) {
    fade_alpha += fade_speed;
    if (fade_alpha >= 1) {
        fade_alpha = 1;
        fade_out = false;
        
        // Find the layer safely
        var _lay_id = layer_get_id("Background");
        if (_lay_id != -1) {
            var _back_id = layer_background_get_id(_lay_id);
            layer_background_sprite(_back_id, target_sprite);
            show_debug_message("Background Switched Successfully!");
        } else {
            show_debug_message("ERROR: Layer 'Background' not found!");
        }
    }
} else {
    fade_alpha -= fade_speed;
    if (fade_alpha <= 0) instance_destroy();
}