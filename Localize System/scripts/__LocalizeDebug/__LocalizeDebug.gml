/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeDebug() {
    if (os_browser != browser_not_a_browser) return 0; // dbg_* functions are broken on HTML
    var _cache = __LocalizeCache();
    
    if (dbg_view_exists(_cache.dbgView)) {
        dbg_view_delete(_cache.dbgView);
    }
    
    var _isDbgOpen = is_debug_overlay_open();
    var _width = 350;
    var _height = 350;
    _cache.dbgView = dbg_view($"Localize System v{LOC_VERSION}", _isDbgOpen, 128, 128, _width, _height);
    _cache.dbgSection = dbg_section("Main Section", true);
    
    dbg_drop_down(ref_create(_cache, "locLangCode"), LocalizeGetLangCodes(), "Game Language");
    dbg_watch(ref_create(_cache, "osLangCode"), "System Language");
    dbg_watch(ref_create(_cache, "locFallCode"), "Fallback Language");
    dbg_watch(ref_create(_cache, "fetchAllowed"), "Download Allowed");
    dbg_watch(ref_create(_cache, "sandboxed"), "Sandboxed");
    dbg_watch(ref_create(_cache, "langCount"), "Loaded Languages");
    
    dbg_text("");
    
    //==========================================================
    dbg_text("Files loaded: ")
    for (var i = 0; i < array_length(_cache.files); i++) {
        var _file = _cache.files[i];
        dbg_text("  -  " + _file.fileName);
    }
    
    dbg_text("");
    
    //==========================================================
    dbg_button("Update Online", function() {
        var _cache = __LocalizeCache();
        for (var i = 0; i < array_length(_cache.files); i++) {
            __LocalizeDownload(i)
        }
    }, _width);
    
    
    //==========================================================
    dbg_button("Update Local", function() {
        var _cache = __LocalizeCache();
        for (var i = 0; i < array_length(_cache.files); i++) {
            __LocalizeUpdate(i)
        }
    }, _width);
    
    
    show_debug_overlay(_isDbgOpen);
}
