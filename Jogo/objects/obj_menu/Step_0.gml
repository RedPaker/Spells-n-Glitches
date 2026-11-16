

if (keyboard_check_pressed(global.st_inv) and !instance_exists(obj_dialogo)) {
    menuaberto = !menuaberto
    global.jogo_pausado = menuaberto
    layer_set_visible("MenuLayer", menuaberto);
    if (menuaberto == false) {
    	layer_set_visible("InventarioLayer", menuaberto);
    }
}
