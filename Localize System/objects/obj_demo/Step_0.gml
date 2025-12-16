LocalizeTagSet("sec", current_second);
LocalizeTagSet("os_date", Localize("ui.dateFormat", current_day, current_month, current_year));

if (keyboard_check_pressed(vk_space)) {
    points++;
}

if (keyboard_check_pressed(vk_f9)) {
    show_debug_overlay(!is_debug_overlay_open());
}

if (keyboard_check_pressed(vk_f5)) {
    LocalizeLangSet("en-US")
}

// Language cycle
var _change = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);

if (_change != 0) {
    var _index = LocalizeLangGetIndex();
    var _count = LocalizeLangGetCount();
    var _clamp = false;
    _index += _change;

    if (_clamp) {
        _index = clamp(_index, 0, _count);
    } else {
        _index = (_index < 0 ? _count-1 : (_index >= _count ? 0 : _index));
    }
    LocalizeLangSetIndex(_index);
}