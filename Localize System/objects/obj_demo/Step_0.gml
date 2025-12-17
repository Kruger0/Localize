LocalizeTagSet("sec", current_second);
LocalizeTagSet("os_date", Localize("ui.dateFormat", current_day, current_month, current_year));

var _pointsDelta = keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down);
if (_pointsDelta != 0) {
    points += _pointsDelta;
    points = max(0, points);
}

if (keyboard_check_pressed(vk_f9)) {
    show_debug_overlay(!is_debug_overlay_open());
}

if (keyboard_check_pressed(vk_f5)) {
    LocalizeLangSet("en-US")
}

// Language cycle
var _landDelta = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
if (_landDelta != 0) {
    var _index = LocalizeLangGetIndex();
    var _count = LocalizeLangGetCount();
    var _clamp = false;
    _index += _landDelta;

    if (_clamp) {
        _index = clamp(_index, 0, _count);
    } else {
        _index = (_index < 0 ? _count-1 : (_index >= _count ? 0 : _index));
    }
    LocalizeLangSetIndex(_index);
}