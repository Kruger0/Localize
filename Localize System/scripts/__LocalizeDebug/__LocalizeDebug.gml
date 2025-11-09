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
    
    dbg_view_delete(_cache.dbgView);
    
    var _isDbgOpen = is_debug_overlay_open();
    _cache.dbgView = dbg_view($"Localize System v{LOC_VERSION}", _isDbgOpen, 128, 128, 320, 250);
    _cache.dbgSection = dbg_section("Configuration", true);
        
    dbg_drop_down(ref_create(_cache, "locLangCode"), LocalizeGetLangCodes(), "Game Language");
    
    dbg_text($"Sandboxed: {GM_is_sandboxed ? "TRUE" : "FALSE"}");
    dbg_text($"Can Download: {__LocalizeFetchAllowed() ? "TRUE" : "FALSE"}");
    dbg_text("Files loaded: ")
    for (var i = 0; i < array_length(_cache.files); i++) {
        var _file = _cache.files[i];
        dbg_text("  -  " + _file.fileName);
    }
    
    dbg_button("Update Online", function() {
        var _cache = __LocalizeCache();
        for (var i = 0; i < array_length(_cache.files); i++) {
            __LocalizeDownload(i)
        }
    }, 300);
    
    dbg_button("Update Local", function() {
        var _cache = __LocalizeCache();
        for (var i = 0; i < array_length(_cache.files); i++) {
            __LocalizeUpdate(i)
        }
    }, 300);
    
    show_debug_overlay(_isDbgOpen);
}
