draw_set_alpha(alfa);
draw_set_font(fnt_8_segoeui);
var texto = "";

switch (hint_id) {
	case 0:
        texto = string_concat("Segure ", chr(global.st_run), " para correr.");
        break;
    case 1:
        if (global.quests.mouse == true) {
        	texto = string_concat("Aperte ", chr(global.st_use), " para atacar.");
        break;
        }
}

var multiplicador = 4;

var largura_texto = string_width(texto) * multiplicador;
var altura_texto = string_height(texto) * multiplicador;

var padding_x = 16 * multiplicador; 
var padding_y = 8 * multiplicador; 
var largura_final = largura_texto + padding_x;
var altura_final = altura_texto + padding_y;

var escala_x = largura_final / sprite_get_width(spr_ui_rectangle);
var escala_y = altura_final / sprite_get_height(spr_ui_rectangle);

var tela_largura = display_get_gui_width();
var tela_altura = display_get_gui_height();

var meio_x = tela_largura / 2;

var margem_inferior = 8 * multiplicador;
var pos_y = tela_altura - (altura_final / 2) - margem_inferior;

var caixa_x = meio_x - (largura_final / 2);
var caixa_y = pos_y - (altura_final / 2);

if (hint_id != 1) {
    draw_sprite_ext(spr_ui_rectangle, 0, caixa_x, caixa_y, escala_x, escala_y, 0, c_white, alfa);
	draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(meio_x, pos_y, texto, multiplicador, multiplicador, 0);
    
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
}else {
	if (global.quests.mouse == true) {
        draw_sprite_ext(spr_ui_rectangle, 0, caixa_x, caixa_y, escala_x, escala_y, 0, c_white, alfa);
        
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text_transformed(meio_x, pos_y, texto, multiplicador, multiplicador, 0);
        
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_alpha(1);
    }
}

