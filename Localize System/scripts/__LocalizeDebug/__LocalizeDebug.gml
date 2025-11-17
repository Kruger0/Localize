/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeDebug() {
    static _cache = __LocalizeCache();
    if (os_browser != browser_not_a_browser) return 0;
    
    if (dbg_view_exists(_cache.dbgView)) {
        dbg_view_delete(_cache.dbgView);
    }
    
    var _isDbgOpen = is_debug_overlay_open();
    var _width = 400;
    var _height = 450;
    var _align = 0;
    _cache.dbgView = dbg_view($"Localize System v{__LOC_VERSION}", _isDbgOpen, 128, 128, _width, _height);
    _cache.dbgSection = dbg_section("Main Section", true);
    
    //==========================================================
    
    dbg_text_separator("Language", _align);
    
    dbg_drop_down(ref_create(_cache, "locLangCode"), LocalizeGetLangCodes(), "Game Language");
    dbg_watch(ref_create(_cache, "osLangCode"), "System Language");
    dbg_watch(ref_create(_cache, "locLangCode"), "Game Language");
    dbg_watch(ref_create(_cache, "locFallCode"), "Fallback Language");
    dbg_checkbox(ref_create(_cache, "debugMode"), "Debug Mode");
    
    //==========================================================
    
    dbg_text("");
    dbg_text_separator("Files", _align);
    
    dbg_watch(ref_create(_cache, "fetchAllowed"), "Download is Allowed");
    dbg_watch(ref_create(_cache, "sandboxed"), "Game is Sandboxed");
    dbg_watch(ref_create(_cache, "langCount"), "Loaded Languages");
    //TODO include compression status
    
    dbg_text("");
    
    var _fileCount = array_length(_cache.files)
    dbg_text($"Files Loaded ({_fileCount}): ")
    for (var i = 0; i < _fileCount; i++) {
        var _file = _cache.files[i];
        dbg_text("  -  " + _file.fileName);
    }
    var _files = _cache.files;
    if (array_length(_files) > 0) {
        dbg_text("Path: " + filename_path(_files[0].fileName));
    }
    
    //==========================================================
    
    dbg_text("");
    dbg_text_separator("Buttons", _align);
    
    dbg_button("Update Files Online", function() {
        static _cache = __LocalizeCache();
        for (var i = 0; i < array_length(_cache.files); i++) {
            __LocalizeDownload(i);
        }
    }, _width);
    
    //==========================================================
    dbg_button("Update Files Localy", function() {
        static _cache = __LocalizeCache();
        for (var i = 0; i < array_length(_cache.files); i++) {
            __LocalizeUpdate(i);
        }
    }, _width);
    
    show_debug_overlay(_isDbgOpen);
}
