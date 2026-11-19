if (instance_exists(obj_dialogo)) exit;
var _crnt_dialog = "";
    
if (instance_exists(obj_plr_rpg) && distance_to_object(obj_plr_rpg) < reach){
    can_talk = true;
    if (keyboard_check_pressed(input_key)){
        switch (dialog_id) {
        	case 0:
                _crnt_dialog = d_select_dialog(dialogs1[times]);
                d_create_dialog(_crnt_dialog, id);
                if (times<1) {
                	times++
                }
                break;
            case 1:
                _crnt_dialog = d_select_dialog(dialogs2[times]);
                d_create_dialog(_crnt_dialog, id);
                if (times<1) {
                	times++
                }
                break;
        }
    }
} else {
	can_talk = false;
}