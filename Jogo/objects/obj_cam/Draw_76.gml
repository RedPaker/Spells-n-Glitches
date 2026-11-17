if (global.jogo_pausado == true){
        exit;
}
var _camx = obj_plr_rpg.cam_x;
var _camy = obj_plr_rpg.cam_y;

var _plrx = obj_plr_rpg.x;
var _plry = obj_plr_rpg.y;


if (obj_plr_rpg.state == 2 or obj_plr_rpg.state == 4) {
	x = lerp(x, _plrx, .9);
    y = lerp(y, _plry, .9);
}else{
    if(obj_plr_rpg.empurra>0){
        x = lerp(x, _plrx, .4); //para mostrar um pouco mais a frente do jogador
        y = lerp(y, _plry, .4);
    }else {
        x = lerp(x, _plrx+(_camx*50), .025); //para mostrar um pouco mais a frente do jogador
        y = lerp(y, _plry+(_camy*50), .025);
    }
}

if (obj_spellbook.abrir || instance_exists(obj_choque)){
    x = obj_plr_rpg.x
    y = obj_plr_rpg.y
}


switch (size) {
    case 0:
        size_x = defaultwidth;
        size_y = defaultheight;
        break;
    default:
        size_x = defaultwidth;
        size_y = defaultheight;
        break;
    /*case 1:
        size_x = defaultwidth * 1.5;
        size_y = defaultheight * 1.5;
        break;
    case 2:
        size_x = defaultwidth * 2;
        size_y = defaultheight * 2;
        break;
    case 3:
        size_x = defaultwidth * 3;
        size_y = defaultheight * 3;
        break;
    case 4:
        size_x = defaultwidth * 4;
        size_y = defaultheight * 4;
        break;
    case 5:
        size_x = defaultwidth / 2;
        size_y = defaultheight / 2;
        break;
    case 6:
        size_x = defaultwidth / 1.5;
        size_y = defaultheight / 1.5;
        break;*/
}
if (keyboard_check_pressed(ord("O"))) {
	size++;
    show_debug_message(size);
    if(size>6){
        size = 0;
    }
}

camera_set_view_size(view_camera[0], size_x, size_y);

if (room_width > size_x) {
    x = clamp(x, 0 + size_x / 2, room_width - size_x / 2);
} else {
    x = room_width / 2;
}

if (room_height > size_y) {
    y = clamp(y, 0 + size_y / 2, room_height - size_y / 2);
} else {
    y = room_height / 2;
}

camera_set_view_pos(view_camera[0], (x-(size_x/2)), (y-(size_y/2)));
