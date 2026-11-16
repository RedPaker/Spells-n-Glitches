if (instance_exists(obj_dialogo)) exit;
    
if (instance_exists(obj_plr_rpg) && distance_to_object(obj_plr_rpg) < reach){
    can_talk = true;
    if (keyboard_check_pressed(input_key)){
        switch (dialog_id) {
        	case 0:
                d_create_dialog(dialog1, id);
                break;
        }
        d_create_dialog(dialog, id);
    }
} else {
	can_talk = false;
}