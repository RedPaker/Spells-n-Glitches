if (current_message < 0) exit;

var _e = ease_out_cubic(anim);

var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

// quanto o balão está deslocado para baixo (0 = totalmente aberto)
var _slide = (1 - _e) * (_boxh + 300);

draw_sprite_stretched(spr_ui_frame_dialogo, 0, _dx, _dy + _slide, _boxw, _boxh);

// Reseta o alinhamento global para evitar cortes e deslocamentos
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _margem_esq = 20;
var _margem_dir = 200; // espaço livre na direita para o retrato não cobrir o texto
_dx += _margem_esq;
_dy += 16;

var _text_scale = 4;
draw_set_font(fnt_6_segoeui);

var _name = messages[current_message].name;
draw_set_colour(global.char_colors[$ _name]);
draw_text_transformed(_dx, _dy + _slide, _name, _text_scale, _text_scale, 0);
draw_set_colour(c_white);

// Usa a altura real do nome escalado + 8px de folga
_dy += (string_height(_name) * _text_scale) + 8;

var _max_width = (_boxw - _margem_esq - _margem_dir) / _text_scale;
draw_set_font(fnt_8_segoeui);
draw_text_ext_transformed(_dx, _dy + _slide, draw_message, -1, _max_width, _text_scale, _text_scale, 0);

// retrato com zoom: começa em 70% e passa um pouco de 100% antes de assentar
var _z = ease_out_back(zoom);
var _esc = 4 * lerp(0.7, 1, _z);

draw_sprite_ext(global.sprites[$ _name], 0, _boxw - 120, _boxh + 250 + _slide, _esc, _esc, 0, c_white, min(1, zoom * 2));