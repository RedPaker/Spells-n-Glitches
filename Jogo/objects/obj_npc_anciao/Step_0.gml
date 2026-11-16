if (instance_exists(obj_dialogo)) exit;
    
if (instance_exists(obj_plr_rpg) && distance_to_object(obj_plr_rpg) < reach){
    can_talk = true;
    if (keyboard_check_pressed(input_key)){
        d_create_dialog(dialog, id);
        acabou_ganhou = true
    }
    foi_tut_binario= true
} else {
	can_talk = false;
}

if (acabou_ganhou && !instance_exists(obj_dialogo)){
    instance_create_layer(x,y+16,"Itens",obj_item_livro)
    acabou_ganhou = false
}