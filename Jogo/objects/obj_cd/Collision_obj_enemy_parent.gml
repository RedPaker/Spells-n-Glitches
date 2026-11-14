if(!atingiu){
    if(other.object_index == obj_arceight_body){
        if (other.kapows > 0) { 
            var _texto = instance_create_layer(other.x, other.y-12, "instances", obj_damage_count);
            _texto.dano = "NO EFFECT"
        }else {
        	other.hp -= dano;
            var _texto = instance_create_layer(other.x, other.y-12, "instances",obj_damage_count);
            _texto.dano = dano
        }
    }else {
        other.hp -= dano;
        var _texto = instance_create_layer(other.x, other.y-12, "instances",obj_damage_count);
        _texto.dano = dano
    }
    
    var _xdir = lengthdir_x(8, direcao);
    var _ydir = lengthdir_y(8, direcao);
    
    var _ptype = undefined;
    if (_ptype == undefined) {
        var _temp = part_system_create(ps_cdhit);
        var _info = part_system_get_info(_temp);
        _ptype = _info.emitters[0].parttype.ind;
        part_system_destroy(_temp);
    }
    
    part_type_direction(_ptype, direcao+_xdir, direcao+_ydir, 0, 0);
    
    var _ps = part_system_create(ps_cdhit);
    part_system_position(_ps, other.x, other.y);
    part_system_colour(_ps, #6839e1, 1);
    part_system_depth(_ps, -other.bbox_bottom - 32);

    
	other.dano_time = 15;
	
	other.empurra = 7;
	other.empurra_dir =point_direction(obj_plr_rpg.x, obj_plr_rpg.y, other.x, other.y);
	
	atingiu = true;
	
    instance_destroy()
	
	}