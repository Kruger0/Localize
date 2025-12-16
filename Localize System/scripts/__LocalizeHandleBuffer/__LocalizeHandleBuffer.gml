// feather ignore all
///@ignore
function __LocalizeHandleBuffer(buffer, status, fileId) {
    static _cache   = __LocalizeCache();
    var _t          = get_timer();
    var _file       = _cache.files[fileId];
    var _fileName   = _file.fileName;
    var _size;
    
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
        _size = buffer_get_size(buffer);
        if (_size == 0) {
            __LocalizeTrace(LOC_TRACE.CRITICAL, $"Error: Buffer from file '{_fileName}' is empty and could not be read - status '{status}'");
            buffer_delete(buffer);
            return 0;
        }
    };
    
    // Check buffer hash
    var _hash = buffer_md5(buffer, 0, _size);
    if (_file.hash == _hash) {
        __LocalizeTrace(LOC_TRACE.VERBOSE, $"File '{_fileName}' content has not changed. Update skipped");
        buffer_delete(buffer);
        return 1;
    }
    _file.hash = _hash;
    
    // Load buffer to memory
    _cache.files[fileId].size = _size;
    var _sheet = __LocalizeLoadCsv(buffer);
    
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
            var _cell = string_trim(_line[j]);
            
            // Internal command keys
            switch (_key) {
                case __LOC_CMD_LANGNAME: {
                    if (_cell != "") {
                        _targLang.langName = _cell;
                    }
                } break;
                case __LOC_CMD_FONTNAME: {
                    if (_cell != "") {
                        var _font = _cache.definedFont[$ _targLang.langCode] ?? _cell;
                        
                        // Check for external font file
                        if (is_string(_font) && (string_pos(".ttf", _font) || string_pos(".otf", _font) || string_pos(".ttc", _font))) {
                            var _params = string_split(_font, ":");
                            var _path   = string_trim(_params[0]);
                            var _size   = (array_length(_params) > 1) ? _params[1] : string(LOC_DEFAULT_FONT_SIZE);
                            
                            if (variable_struct_exists(_cache.definedFont, _font)) {
                                _font = _cache.definedFont[$ _font];
                            } else {
                                if (file_exists(_path)) {
                                    var _newFont = font_add(_path, real(_size), false, false, 32, 255);
                                    if (_newFont == -1) {
                                        __LocalizeTrace(LOC_TRACE.CRITICAL, $"Font file '{_path}' failed to load");
                                    } else {
                                        _cache.definedFont[$ _font] = _newFont;
                                        _font = _newFont;
                                    }
                                    __LocalizeTrace(LOC_TRACE.VERBOSE, $"Loaded external font '{_path}' at size {_size}");
                                } else {
                                    __LocalizeTrace(LOC_TRACE.CRITICAL, $"Font file '{_path}' is missing");
                                }
                            }
                        }
                        
                        // Check for internal font asset
                        var _fontId = is_string(_font) ? asset_get_index(_font) : _font;
                        if (font_exists(_fontId)) {
                            _font = _fontId;
                        }
                        _targLang.langFont = _font;
                        //_cache.definedFont[$ _targLang.langCode] = _font;
                        __LocalizeTrace(LOC_TRACE.VERBOSE, $"Language '{_targLang.langCode}' mapped to font '{_font}'");
                    }
                } break;
                case __LOC_CMD_PRODUCTION: {
                    if (_cell != "") {
                        var _enabled = string_lower(_cell) == "enabled";
                        _targLang.langEnabled = (GM_build_type == "run" || _enabled);
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
        var _finalCodes = [];
        var _finalNames = [];
        var _totalLen = array_length(_cache.langCodes);
        for (var i = 0; i < _totalLen; i++) {
            var _code  = _cache.langCodes[i];
            var _entry = _cache.locDatabase[$ _code];
            if (!is_undefined(_entry) && _entry.langEnabled) {
                array_push(_finalCodes, _code);
                array_push(_finalNames, _entry.langName);
            }
        }
        _cache.langCodes = _finalCodes;
        _cache.langNames = _finalNames;
        _cache.langCount = array_length(_finalCodes);
    }
    
    _cache.files[fileId].loaded = true;
    __LocalizeTrace(LOC_TRACE.VERBOSE, $"File '{_fileName}' loaded into database after {(get_timer()-_t)/1000}ms with {__LocalizeFormatBytes(_cache.files[fileId].size)}");
    __LocalizeDebug();
    return 1;
}