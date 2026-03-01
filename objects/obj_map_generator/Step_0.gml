// --- Camera / View Tracking ---
// This smoothly slides the camera to focus on the player's current layer

// 1. Determine where the camera SHOULD be
// We calculate this based on the current layer (0 is bottom, 5 is top)
var _target_y = 0;

// global.current_layer should be tracked in your game controller or as a global
if (variable_global_exists("current_layer")) {
    // Offset the camera by the layer height (120 is the spacing we used in Create)
    _target_y = -(global.current_layer * 120);
}

// 2. Smoothly move the camera (Lerp)
var _curr_y = camera_get_view_y(view_camera[0]);
var _new_y = lerp(_curr_y, _target_y, 0.1);

camera_set_view_pos(view_camera[0], 0, _new_y);