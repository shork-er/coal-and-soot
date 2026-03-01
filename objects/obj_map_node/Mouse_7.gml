show_debug_message("Node clicked! Type is: " + string(my_type));

switch (my_type) {
    case "Combat":
        room_goto(rm_battle); 
        break;
        
    case "Loot":
        // Make sure these room names are EXACTLY what you have in your Asset Browser
        room_goto(rm_gameplay); 
        break;
        
    case "Boss":
        room_goto(rm_battle); 
        break;

    default:
        show_debug_message("Error: Type '" + string(my_type) + "' doesn't match any case!");
        break;
}