/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeHandleBuffer(buffer, status, fileId) {
    static _cache = __LocalizeCache();
    var _t = get_timer();
    var _fileName = _cache.files[fileId].fileName;
    
    show_debug_message($"PRE ERROR CHECK {(get_timer()-_t)/1000}ms")
    // Error checking
    if !(status) {
        __LocalizeTrace(LOC_TRACE.CRITICAL, $"Error: Failed to load buffer from file '{_fileName}' - status '{status}'");
        return 0;
    }
    if (!buffer_exists(buffer)) return 0;
    if (buffer_get_size(buffer) == 0) {
        __LocalizeTrace(LOC_TRACE.CRITICAL, $"Error: Buffer from file '{_fileName}' is empty and could not be read - status '{status}'");
        return 0;
    }
    
    show_debug_message($"PRE COMP {(get_timer()-_t)/1000}ms")
    // Check for sheet compression
    buffer_seek(buffer, buffer_seek_start, 0);
    if (buffer_get_size(buffer) >= 2) {
        var _header = buffer_read(buffer, buffer_u16);
        if (_header == 0x9C78) { // zlib default header
            var _decomp = buffer_decompress(buffer);
            buffer_delete(buffer);
            buffer = _decomp;
        }
    }
    buffer_seek(buffer, buffer_seek_start, 0);
    _cache.files[fileId].size = buffer_get_size(buffer);
    
    show_debug_message($"PRE LOAD CSV {(get_timer()-_t)/1000}ms")
    // Load buffer to memory
    var _sheet = __LocalizeLoadCsv(buffer);
    
    show_debug_message($"PRE DELETE {(get_timer()-_t)/1000}ms")
    buffer_delete(buffer);
    
    show_debug_message($"PRE HEADERS {(get_timer()-_t)/1000}ms")
    var _rowCount = array_length(_sheet);
    if (_rowCount == 0) {
        __LocalizeTrace(LOC_TRACE.CRITICAL, $"Error: Parsed .csv of '{_fileName}' is empty");
        return 0;
    }
    
    var _headerRow  = _sheet[0];
    var _colCount   = array_length(_headerRow);
    var _colToLang  = array_create(_colCount, undefined);
    var _langCodes  = [];
    var _langNames  = [];
    var _langCount  = 0;
    
    // Load language headers
    for (var i = 1; i < _colCount; i++) {
        var _cell = _headerRow[i];
        if (_cell == "") continue;
        var _langData = string_split(_cell, LOC_LANGCODE_DELIM);
        var _langName = _langData[0];
        if (_langName == "") continue;
        var _langCode = (array_length(_langData) > 1) ? _langData[1] : _langName;
        var _hasCode = (array_length(_langData) > 1);
        array_push(_langCodes, _langCode);
        array_push(_langNames, _langName);
        _langCount++;
        _cache.locDatabase ??= {};
        var _entry = _cache.locDatabase[$ _langCode];
        if (is_undefined(_entry)) {
            __LocalizeTrace(LOC_TRACE.VERBOSE, $"Creating entry for language '{_langCode}' {_hasCode ? "" : "(Warning: Use format 'English_en-US' better compatibility)"}");
            _entry = new __LocalizeLangClass(_langName, _langCode);
            _cache.locDatabase[$ _langCode] = _entry;
        }
        _colToLang[i] = _entry;
    }
    
    show_debug_message($"PRE KEYS {(get_timer()-_t)/1000}ms")
    // Load text keys
    for (var i = 1; i < _rowCount; i++) {
        var _line = _sheet[i];
        if (array_length(_line) < 2) continue;
        var _key = _line[0];
        if (_key == "" || string_ord_at(_key, 1) == 35) continue; // char #
        for (var j = 1; j < array_length(_line); j++) {
            var _target = _colToLang[j];
            if (is_undefined(_target)) continue;
            var _cell = _line[j];
            if (LOC_REPLACE_NEWLINE) {
                if (string_pos("\\", _cell) != 0) {
                    _cell = string_replace_all(_cell, "\\n", "\n");
                    _cell = string_replace_all(_cell, "\\r", "\r");
                }
            }
            _target.langKeys[$ _key] = _cell;
        }
    }
    
    show_debug_message($"PRE CACHE {(get_timer()-_t)/1000}ms")
    if (_langCount > 0) {
        _cache.langCodes = array_union(_cache.langCodes, _langCodes);
        _cache.langNames = array_union(_cache.langNames, _langNames);
        _cache.langCount = array_length(_cache.langCodes);
    }
    
    _cache.files[fileId].loaded = true;
    __LocalizeTrace(LOC_TRACE.VERBOSE, $"File '{_fileName}' loaded into database after {(get_timer()-_t)/1000}ms with {__LocalizeFormatBytes(_cache.files[fileId].size)}");
    __LocalizeDebug();
    return 1;
}