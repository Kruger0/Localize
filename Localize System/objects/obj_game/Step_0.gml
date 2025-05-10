
if (keyboard_check_pressed(vk_enter)) {
	points++;
}

if (keyboard_check_pressed(vk_f9)) {
	show_debug_overlay(!is_debug_overlay_open())
}

var _change = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
if (_change != 0) {
	var _lang = localize_get_lang_id()+_change
	if (_lang < 0) {
		_lang = localize_get_lang_count()-1
	}
	if (_lang > localize_get_lang_count()-1) {
		_lang = 0
	}
	localize_set_lang(_lang)
}