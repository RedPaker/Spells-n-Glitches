var _win_w = window_get_width();
var _win_h = window_get_height();

if (_win_w > 0 && _win_h > 0) {
    if (display_get_gui_width() != _win_w || display_get_gui_height() != _win_h) {
        display_set_gui_size(_win_w, _win_h);
    }
}

var _app_pos = application_get_position();
var _app_x1 = _app_pos[0];
var _app_y1 = _app_pos[1];
var _app_x2 = _app_pos[2];
var _app_y2 = _app_pos[3];
var _app_h  = _app_y2 - _app_y1;

// Como o viewport é fixo em 1280x720, basta usar _app_h / 720
// (Troque 3 por 4 se quiser o tooltip na mesma escala exata da câmera 320x180)
var _escala = 3 * (_app_h / 720);

var _gui_mx = device_mouse_x_to_gui(0);
var _gui_my = device_mouse_y_to_gui(0);

draw_set_font(fnt_6_segoeui); 
draw_set_halign(fa_left); 
draw_set_valign(fa_top);

var _margem = 12 * _escala; 
var _offset = max(12, 5 * _escala); // max(12, ...) evita que o cursor do Windows cubra a caixa em janelas pequenas
var _sep = 16;
var _wrap_width = 128; 

var _texto_w = string_width_ext(texto, _sep, _wrap_width);
var _texto_h = string_height_ext(texto, _sep, _wrap_width);

var _largura = (_texto_w * _escala) + (_margem * 2);
var _altura = (_texto_h * _escala) + (_margem * 2);

var _pos_x = _gui_mx + _offset;
var _pos_y = _gui_my + _offset;

if (_pos_x + _largura > _app_x2) {
    _pos_x = _gui_mx - _offset - _largura;
}

if (_pos_y + _altura > _app_y2) {
    _pos_y = _gui_my - _offset - _altura;
}

_pos_x = round(clamp(_pos_x, _app_x1, max(_app_x1, _app_x2 - _largura)));
_pos_y = round(clamp(_pos_y, _app_y1, max(_app_y1, _app_y2 - _altura)));

draw_sprite_stretched(spr_ui_frame_4x, 0, _pos_x, _pos_y, _largura, _altura);

draw_set_color(c_white);
draw_set_alpha(1);
draw_text_ext_transformed(round(_pos_x + _margem), round(_pos_y + _margem), texto, _sep, _wrap_width, _escala, _escala, 0);