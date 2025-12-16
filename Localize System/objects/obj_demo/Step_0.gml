
LocalizeTagSet("[os_date]", Localize("ui.dateFormat", current_day, current_month, current_year));

if (keyboard_check_pressed(vk_space)) {
    points++;
}

if (keyboard_check_pressed(vk_f9)) {
    show_debug_overlay(!is_debug_overlay_open());
}

if (keyboard_check_pressed(vk_f5)) {
    LocalizeLangSet("en-US")
}

var _change = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
//if (_change != 0) {
//    var _lang = LocalizeGetLangId()+_change;
//    if (_lang < 0) {
//        _lang = LocalizeLangGetCount()-1;
//    }
//    if (_lang > LocalizeLangGetCount()-1) {
//        _lang = 0;
//    }
//    LocalizeSetLang(_lang);
//}
