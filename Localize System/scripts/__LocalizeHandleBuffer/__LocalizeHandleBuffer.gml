// feather ignore all
///@ignore
function __LocalizeHandleBuffer(buffer, status, fileId) {
    static _cache = __LocalizeCache();
    var _fileName = _cache.files[fileId].fileName;
    
    var _t = get_timer();
    
    // Error checking
    if (!buffer_exists(buffer)) {
        __LocalizeTrace(LOC_TRACE.CRITICAL, $"Error: Buffer from file '{_fileName}' does not exists - status '{status}'");
        return 0;
    } else {
        if !(status) {
            __LocalizeTrace(LOC_TRACE.CRITICAL, $"Error: Failed to load buffer from file '{_fileName}' - status '{status}'");
            buffer_delete(buffer);
            return 0;
        }
        if (buffer_get_size(buffer) == 0) {
            __LocalizeTrace(LOC_TRACE.CRITICAL, $"Error: Buffer from file '{_fileName}' is empty and could not be read - status '{status}'");
            buffer_delete(buffer);
            return 0;
        }
    };
    
    // Load buffer to memory
    _cache.files[fileId].size = buffer_get_size(buffer);
    var _sheet = __LocalizeLoadCsv(buffer);
    show_debug_message($"POST LOAD CSV {(get_timer()-_t)/1000}ms")
    
    buffer_delete(buffer);
    
    var _rowCount = array_length(_sheet);
    if (_rowCount == 0) {
        __LocalizeTrace(LOC_TRACE.CRITICAL, $"Error: Parsed .csv of '{_fileName}' is empty");
        return 0;
    }
    
    var _headerRow  = _sheet[0];
    var _colCount   = array_length(_headerRow);
    var _colToLang  = array_create(_colCount, undefined);
    var _langCodes  = [];
    var _langCount  = 0;
    
    // Load language headers
    for (var i = 1; i < _colCount; i++) {
        var _langCode = _headerRow[i];
        if (_langCode == "") continue;
        array_push(_langCodes, _langCode);
        _langCount++;
        _cache.locDatabase ??= {};
        var _langEntry = _cache.locDatabase[$ _langCode];
        if (is_undefined(_langEntry)) {
            __LocalizeTrace(LOC_TRACE.VERBOSE, $"Creating entry for language '{_langCode}'");
            _langEntry = new __LocalizeLangClass(_langCode);
            _cache.locDatabase[$ _langCode] = _langEntry;
        }
        _colToLang[i] = _langEntry;
    }
    
    // Load text keys
    for (var i = 1; i < _rowCount; i++) {
        var _line = _sheet[i];
        if (array_length(_line) < 2) continue;
        var _key = _line[0];
        if (_key == "") continue;
        for (var j = 1; j < array_length(_line); j++) {
            var _targLang = _colToLang[j];
            if (is_undefined(_targLang)) continue;
            var _cell = _line[j];
            
            // Internal command keys
            switch (_key) {
                case __LOC_CMD_LANGNAME: {
                    if (_cell != "") {
                        _targLang.langName = _cell;
                    }
                } break;
                case __LOC_CMD_FONTNAME: {
                    if (_cell != "") {
                        var _font = string_trim(_cell);
                        var _fontId = asset_get_index(_font);
                        var _defineFont = _cache.definedFont[$ _targLang.langCode];
                        if (!is_undefined(_defineFont)) {
                            _font   = _defineFont;
                            _fontId = _defineFont;
                        }
                        if (font_exists(_fontId)) {
                            _targLang.langFont = _fontId;
                        } else {
                            _targLang.langFont = _font;
                        }
                        __LocalizeTrace(LOC_TRACE.VERBOSE, $"Language '{_targLang.langName}' mapped to font '{_font}'");
                    }
                } break;
                case __LOC_CMD_PRODUCTION: {
                    if (_cell != "") {
                        var _boolStr = string_trim(_cell);
                        _targLang.langEnabled = (GM_build_type != "run" && (_boolStr == "true" || _boolStr == "1"));
                    }
                } break;
                default: {
                    if (LOC_REPLACE_NEWLINE) {
                        if (string_pos("\\", _cell) != 0) {
                            _cell = string_replace_all(_cell, "\\n", "\n");
                            _cell = string_replace_all(_cell, "\\r", "\r");
                        }
                    }
                    _targLang.langKeys[$ _key] = _cell;
                } break;
            }
        }
    }
    
    if (_langCount > 0) {
        _cache.langCodes = array_union(_cache.langCodes, _langCodes);
        _cache.langCount = array_length(_cache.langCodes);
        var _langNames = array_create(_cache.langCount);
        for (var i = 0; i < _cache.langCount; i++) {
            var _code = _cache.langCodes[i];
            _langNames[i] = _cache.locDatabase[$ _code].langName;
        }
        _cache.langNames = _langNames;
    }
    
    _cache.files[fileId].loaded = true;
    __LocalizeTrace(LOC_TRACE.VERBOSE, $"File '{_fileName}' loaded into database after {(get_timer()-_t)/1000}ms with {__LocalizeFormatBytes(_cache.files[fileId].size)}");
    __LocalizeDebug();
    return 1;
}