if (place_meeting(x, y, obj_plr_rpg)) {
    if (keyboard_check_pressed(global.st_use) && array_length(global.inventario_itens) < 12) {

        var _item_data = {
            nome: item_name,
            sprite: spr_file_1,
            obj: object_index,
            use: use,
            n: n,
            info: "Neste arquivo esta escrito: " + string(45),
            throwable: throwable
        };

        array_push(global.inventario_itens, _item_data);

        global.ataque_desbloqueado = true;

        coletado = true;
        instance_destroy();
    }
}