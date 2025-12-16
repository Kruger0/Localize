

if (mouse_check_button_pressed(mb_left)) {
    var _inst = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)
    if (_inst) {
        var _cache = __LocalizeCache()
        for (var i = 0; i < array_length(_cache.files); i++) {
            __LocalizeDownload(i);
        }
        image_blend = c_aqua
    } 


} else {
    image_blend = c_white
}
