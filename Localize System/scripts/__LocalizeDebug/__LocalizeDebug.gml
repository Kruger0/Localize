
///@ignore
function __LocalizeDebug() {
    var _cache = __LocalizeCache();
    if (dbg_view_exists(_cache.dbgvPtr)) {
        dbg_view_delete(_cache.dbgvPtr);
    }
    
    var _dbgref = "";
    var _langs = LocalizeGetLangs();
    for (var i = 0, _len = array_length(_langs); i < _len; i++) {
        _dbgref += _langs[i];
        _dbgref+=$":{i}"+(i < _len-1 ? "," : "");
    }
    
    var _is_dbg_open = is_debug_overlay_open();
    _cache.dbgvPtr = dbg_view("Localize System", _is_dbg_open, 128, 128, 320, 250);
    dbg_section("Language");
    dbg_drop_down(ref_create(_cache, "gameLang"), _dbgref);
    dbg_section("File");
    dbg_text($"GM is sandboxed: {GM_is_sandboxed ? "true" : "false"}");
    dbg_text("File path: " + _cache.locPath);
    dbg_text("File name: " + LOC_FILENAME);
    dbg_button("Update loc.csv online", __LocalizeDownload, 300);
    dbg_button("Update loc.csv local", __LocalizeUpdate, 300);
    show_debug_overlay(_is_dbg_open);
}
