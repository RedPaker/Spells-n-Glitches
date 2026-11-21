if (instance_exists(obj_dialogo)) exit;
var _crnt_dialog = ""
var _hour = current_hour;
var _minute = current_minute;
var _unlockedspells = obj_controller_mg.unlocked_spells
if (_unlockedspells.shock 
    or _unlockedspells.jukebox 
    or _unlockedspells.restart 
    or _unlockedspells.brightness 
    or _unlockedspells.overheat) {
    item_criado = true;
}


if (times == 1 and !item_criado and obj_plr_rpg.coletou_livro == true) {
    if(_hour == _minute){
        var _rand = irandom(8);
        switch (_rand) {
        	case 0:
            case 1:
                instance_create_layer(x, y + 24, "Itens", obj_pagina_brightness);
                break;
        	case 2:
            case 3:
                instance_create_layer(x, y + 24, "Itens", obj_pagina_choque);
                break;
        	case 4:
        	case 5:
                instance_create_layer(x, y + 24, "Itens", obj_pagina_jukebox);
                break;
        	case 6:
        	case 7:
                instance_create_layer(x, y + 24, "Itens", obj_pagina_restart);
                break;
        	case 8:
                instance_create_layer(x, y + 24, "Itens", obj_pagina_OVERHEAT);
                break;
        }
        item_criado = true;
    }
    
}

if (instance_exists(obj_plr_rpg) && distance_to_object(obj_plr_rpg) < reach){
    can_talk = true;
    if (keyboard_check_pressed(input_key)){
        switch (dialog_id) {
        	case 0:
                if (obj_plr_rpg.coletou_livro == false) {
                	_crnt_dialog = d_select_dialog(dialogs1dot1[times]);
                    d_create_dialog(_crnt_dialog, id);
                    if (dialogtimes[0]<7) {
                    	dialogtimes[0]++
                    }
                }else {
                    if (_hour == _minute) {
                        _crnt_dialog = d_select_dialog(dialogs1dot3[times]);
                        d_create_dialog(_crnt_dialog, id);
                        if (dialogtimes[1]<7) {
                        	dialogtimes[1]++
                        }
                    }else {
                        _crnt_dialog = d_select_dialog(dialogs1dot2[0]);
                        d_create_dialog(_crnt_dialog, id);
                    }
                }
                break;
        }
    }
} else {
	can_talk = false;
}