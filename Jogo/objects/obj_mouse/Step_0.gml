
if (variable_global_exists("jogo_pausado") && global.jogo_pausado) exit;

if (place_meeting(x, y, obj_plr_rpg) && keyboard_check_pressed(ord("Z"))) {

    if (array_length(global.inventario_itens) < 12) {

        var _item_data = {
            nome: "mouse",
            sprite: sprite_index,
            obj: object_index,
            use: use,
            n: n,
            info: info,
            throwable: throwable
        };

        array_push(global.inventario_itens, _item_data);

        global.ataque_desbloqueado = true;

        coletado = true;
        instance_destroy();
    }
}
