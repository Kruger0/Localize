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
    var _height = 550;
    _cache.dbgView = dbg_view($"Localize System v{__LOC_VERSION}", true, 128, 128, _width, _height);
    
    // ======================== Language Controlls
    
    dbg_section("Language Controls");
    
    var _codes = _cache.langCodes; 
    if (array_length(_codes) > 0) {
        dbg_drop_down(ref_create(_cache, "locLangCode"), _codes, "Game Language");
    } else {
        dbg_text("No languages loaded yet.");
    }
    dbg_watch(ref_create(_cache, "osLangCode"),     "System Language");
    dbg_watch(ref_create(_cache, "locFallCode"),    "Fallback Language");
    dbg_checkbox(ref_create(_cache, "debugMode"),   "Debug Mode");
    
    // ======================== File Statistics
    
    dbg_text("");
    dbg_section("File Statistics");
    
    dbg_watch(ref_create(_cache, "langCount"),      "Loaded Languages:");
    dbg_watch(ref_create(_cache, "fetchAllowed"),   "Download Allowed:");
    dbg_watch(ref_create(_cache, "sandboxed"),      "Sandboxed:");
    
    dbg_text("");
    
    var _fileCount = array_length(_cache.files);
    var _totalSize = 0;
    var _gapSize = 40;
    
    dbg_text($"Files Loaded ({_fileCount}): ");
    
    for (var i = 0; i < _fileCount; i++) {
        var _file = _cache.files[i];
        var _nameStr = _file.fileName;
        var _sizeStr = $"{string_format(_file.size/1024, 0, 2)} KB";
        var _charGap = max(1, (_gapSize - string_length(_nameStr)) - string_length(_sizeStr));
        var _text = $"{_nameStr} {string_repeat(".", _charGap)} {_sizeStr}";
        dbg_text("- " + _text);
        _totalSize += _file.size;
    }
    
    if (_fileCount > 0) {
        dbg_text(""); 
        var _labelStr = "Total Memory";
        var _sizeStr  = $"{string_format(_totalSize/1024, 0, 2)} KB";
        var _charGap = max(1, (_gapSize - string_length(_labelStr)) - string_length(_sizeStr));
        var _text = $"{_labelStr} {string_repeat(".", _charGap)} {_sizeStr}";
        dbg_text("  " + _text); 
        
        var _rawPath = _cache.savePath;
        var _wrapPath = "";
        var _len = string_length(_rawPath);
        var _charLimit = _gapSize;
        for (var k = 1; k <= _len; k++) {
            _wrapPath += string_char_at(_rawPath, k);
            if (k % _charLimit == 0) _wrapPath += "\n";
        }
        dbg_text("");
        dbg_text($"Save Path:\n{_wrapPath}"); 
    }
    
    // ======================== Actions
    
    dbg_text("");
    dbg_section("Actions");
    dbg_button("Refresh Debug View", function() {
        __LocalizeDebug();
    }, _width);
    
    dbg_button("Update Files Online", function() {
        static _cache = __LocalizeCache();
        for (var i = 0; i < array_length(_cache.files); i++) {
            __LocalizeDownload(i);
        }
    }, _width);
    
    dbg_button("Update Files Locally", function() {
        static _cache = __LocalizeCache();
        for (var i = 0; i < array_length(_cache.files); i++) {
            __LocalizeUpdate(i);
        }
    }, _width);
    
    show_debug_overlay(_isDbgOpen);
}
