/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeDebug() {
    var _cache = __LocalizeCache();
    if (dbg_view_exists(_cache.debugPtr)) {
        dbg_view_delete(_cache.debugPtr);
    }
    
    var _dbgref = "";
    var _langs = LocalizeGetLangs();
    for (var i = 0, _len = array_length(_langs); i < _len; i++) {
        _dbgref += _langs[i][0];
        _dbgref += $":{i}"+(i < _len-1 ? "," : "");
    }
    
    var _is_dbg_open = is_debug_overlay_open();
    _cache.debugPtr = dbg_view($"Localize System v{LOC_VERSION}", _is_dbg_open, 128, 128, 320, 250);
    dbg_drop_down(ref_create(_cache, "gameLang"), _dbgref, "Game Language");
    dbg_text($"Sandboxed: {GM_is_sandboxed ? "TRUE" : "FALSE"}");
    dbg_text("Path: " + filename_path(LOC_FILENAME) + LOC_FILENAME);
    dbg_button("Update online", __LocalizeDownload, 300);
    dbg_button("Update local", __LocalizeUpdate, 300);
    show_debug_overlay(_is_dbg_open);
}
