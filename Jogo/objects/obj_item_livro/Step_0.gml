// Inherit the parent event
event_inherited();

if (obj_plr_rpg.coletou_livro == false) {
	visible = true;
}else {
	instance_destroy();
}

if(place_meeting(x, y, obj_plr_rpg)){
  if(keyboard_check_pressed(ord("Z"))){
        obj_plr_rpg.coletou_livro = true;
        layer_set_visible("GuiLayer",true);
        instance_deactivate_object(id);
    }
}
