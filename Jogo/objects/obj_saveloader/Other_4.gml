
if (instance_exists(obj_plr_rpg)) {
    obj_plr_rpg.x = char.x;
    obj_plr_rpg.y = char.y;
    obj_plr_rpg.facing = char.face;
    obj_plr_rpg.hp = char.hp;
    obj_plr_rpg.coletou_livro = char.unlocked_book;
} else {
    var _plr = instance_create_layer(char.x, char.y, "Entities", obj_plr_rpg);
    _plr.hp = char.hp;
    _plr.coletou_livro = char.unlocked_book;
    _plr.facing = char.face;
}

if (variable_struct_exists(char, "ataque_desbloqueado")) {
    global.ataque_desbloqueado = char.ataque_desbloqueado;
} else {
    global.ataque_desbloqueado = false;
}

if (global.ataque_desbloqueado && instance_exists(obj_mouse)) {
    with (obj_mouse) {
        instance_destroy();
    }
}

instance_destroy();
