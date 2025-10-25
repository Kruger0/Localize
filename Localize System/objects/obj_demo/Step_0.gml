
if (keyboard_check_pressed(vk_space)) {
    points++;
}

if (keyboard_check_pressed(vk_f9)) {
    show_debug_overlay(!is_debug_overlay_open());
}

if (keyboard_check_pressed(vk_f5)) {
  __LocalizeUpdate()
}

var _change = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
if (_change != 0) {
    var _lang = LocalizeGetLangId()+_change;
    if (_lang < 0) {
        _lang = LocalizeGetLangCount()-1;
    }
    if (_lang > LocalizeGetLangCount()-1) {
        _lang = 0;
    }
    LocalizeSetLang(_lang);
}