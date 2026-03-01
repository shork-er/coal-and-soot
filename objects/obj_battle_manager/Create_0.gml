// Stats from your sticky notes
player_hp = 20;
player_max_hp = 20;
is_stunned = false;

// 1. Enemy Selection
var _enemies = ["Pedecenti", "Crawler", "Kymera"];
current_enemy = _enemies[irandom(2)];

// 2. Assign Stats and Sprites (Idle AND Attack)
switch (current_enemy) 
{ 
    case "Pedecenti":
        enemy_hp = 13;
        enemy_max_hp = 13;
        s_idle = s_pedecenti_idle;
        s_attack = s_pedecenti_atk;
        break;
        
    case "Crawler":
        enemy_hp = 25;
        enemy_max_hp = 25;
        s_idle = s_crawler_idle;
        s_attack = s_crawler_atk;
        break;
        
    case "Kymera":
        enemy_hp = 8;
        enemy_max_hp = 8;
        s_idle = s_kymera_idle;
        s_attack = s_kymera_atk;
        break;
        
    default:
        enemy_hp = 15;
        enemy_max_hp = 15;
        s_idle = s_enemy_idle;
        s_attack = s_enemy_attack;
        break;
}

battle_log = "A " + current_enemy + " appears!";
can_flip = true;
state = "idle";