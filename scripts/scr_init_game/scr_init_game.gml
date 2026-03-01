global.current_room_type = "Unknown";
global.current_layer = 0;
// Add any other globals you use here!
enum BATTLE_STATE {
    IDLE,
    PLAYER_TURN,
    ENEMY_TURN,
    WIN,
    LOSE
}