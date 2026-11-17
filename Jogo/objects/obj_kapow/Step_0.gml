
if state == "explode"{
    sprite_index = spr_kapowxplod;
    if (layer_exists("ShakeEffect")) {
        layer_set_visible("ShakeEffect", true);
    }
    if (instance_exists(obj_arceight_body)) {
        if (obj_arceight_body.kapows >0) {
            obj_arceight_body.kapows--;
        }else {
            obj_arceight_body.hp -= 5;
            var _texto = instance_create_layer(obj_arceight_body.x, obj_arceight_body.y-12, "instances",obj_damage_count);
            _texto.dano = 5
        }
    }
    state = "done"
}