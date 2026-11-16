// Inherit the parent event
event_inherited();

if (dialog_id == 0) {
    dialog = d_select_dialog("welcome_dialog");
}
else if (dialog_id == 1) {
    dialog = d_select_dialog("tutorial_binario_dialog");
}

if (instance_exists(obj_binario_puzzle) && global.quests.binario = true && obj_binario_puzzle.tempo_mensagem == 0 && cala_a_boca = false){
    dialog = d_select_dialog("binario_certo")
    d_create_dialog(dialog,id)
    cala_a_boca = true
}

if (instance_exists(obj_binario_puzzle) && global.quests.binario = false && obj_binario_puzzle.tempo_mensagem == 0 && cala_a_boca_tut = false && obj_binario_puzzle.burro_demais > 0){
    dialog = d_select_dialog("tutorial_binario_dialog")
    d_create_dialog(dialog,id)
    cala_a_boca_tut = true
}

if (instance_exists(obj_binario_puzzle)){
    dialog_id  = 1
    visible = false
} else {
    dialog_id = 0
    visible = true
}


