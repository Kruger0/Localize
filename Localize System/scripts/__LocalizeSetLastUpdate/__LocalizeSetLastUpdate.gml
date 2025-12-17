// feather ignore all
/// @ignore
function __LocalizeSetLastUpdate(){
    static _cache = __LocalizeCache()
    var _dt = date_current_datetime();
    var _h = string_replace_all(string_format(date_get_hour(_dt), 2, 0), " ", "0");
    var _m = string_replace_all(string_format(date_get_minute(_dt), 2, 0), " ", "0");
    var _s = string_replace_all(string_format(date_get_second(_dt), 2, 0), " ", "0");
    _cache.lastUpdate = $"{_h}:{_m}:{_s}";
}