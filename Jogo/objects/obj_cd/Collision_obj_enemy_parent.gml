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
    
    
    var _ps = part_system_create(ps_cdhit);
    part_system_position(_ps,other.x,other.y);
    part_system_colour(_ps, #7c6da2, 1); // (system_id, color, alpha)
    part_system_angle(_ps, direcao);
    part_system_depth(_ps, -other.y -32);
    
	other.dano_time = 15;
	
	other.empurra = 7;
	other.empurra_dir =point_direction(obj_plr_rpg.x, obj_plr_rpg.y, other.x, other.y);
	
	atingiu = true;
	
    instance_destroy()
	
	}