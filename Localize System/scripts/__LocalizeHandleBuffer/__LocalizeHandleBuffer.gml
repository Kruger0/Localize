/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeHandleBuffer(buffer, status) {
    static _cache = __LocalizeCache();
    var _t = get_timer();
    if !(status) {
        __LocalizeTrace(LOC_TRACE.CRITICAL, $"Error loading buffer: {buffer} - {status}");
        return 0;
    }
    
    // Check for sheet compression
    buffer_seek(buffer, buffer_seek_start, 0);
    var _header = buffer_read(buffer, buffer_u16);
    if (_header == 0x9C78) { // zlib default compression header
        var _decomp = buffer_decompress(buffer);
        buffer_delete(buffer);
        buffer = _decomp;
        buffer_seek(buffer, buffer_seek_start, 0);
    }
    var _size = buffer_get_size(buffer);
    
    // Load buffer to memory
    var _sheet = __LocalizeLoadCsv(buffer);
    buffer_delete(buffer);
    if (array_length(_sheet) == 0) {
        __LocalizeTrace(LOC_TRACE.CRITICAL, $"Error loading .csv as array");
        return 0;
    }
    var _langCodes = [];
    var _langNames = [];
    var _langCode = "";
    // Iterate rows
    for (var i = 0; i < array_length(_sheet); i++) {
        var _line = _sheet[i];
        var _key = _line[0];
        if (i > 0 && _key == "") continue;
        
        // Iterate cols
        for (var j = 0; j < array_length(_line); j++) {
            var _cell = _line[j];
            
            // Store language
            if (i == 0 && j > 0) {
                var _langData = string_split(_cell, LOC_LANGCODE_DELIM);
                var _langName = _langData[0];
                if (_langName == "") continue;
                var _hasCode = false;
                if (array_length(_langData) > 1) {
                    _langCode = _langData[1]; 
                    _hasCode = true;
                } else {
                    _langCode = _langName;
                }
                _line[j] = _langCode;
                array_push(_langCodes, _langCode);
                array_push(_langNames, _langName);
                _cache.locDatabase ??= {};
                var _cacheLang = _cache.locDatabase[$ _langCode];
                if (is_undefined(_cacheLang)) {
                    __LocalizeTrace(LOC_TRACE.VERBOSE, $"Creating entry for language '{_langCode}' {_hasCode ? "" : "(Warning: Use full locale format like 'English_en-US' instead of just 'English' for better compatibility)"}");
                    _cache.locDatabase[$ _langCode] = {
                        langName: _langName,
                        langCode: _langCode,
                        langKeys: {},
                    };
                }
            }
            
            // Store translations
            if (i > 0 && j > 0) {
                _langCode = _sheet[0][j];
                if (_langCode == "") continue;
                
                // Replace escaped linebreaks for real ones
                if (LOC_REPLACE_NEWLINE) {
                    _cell = string_replace_all(_cell, "\\n", "\n");
                    _cell = string_replace_all(_cell, "\\r", "\r");
                }
                
                // Add translation to database
                _cache.locDatabase[$ _langCode].langKeys[$ _key] = _cell;
            }
        }
    }
    
    // Finish process
    _cache.langCodes = array_union(_cache.langCodes, _langCodes);
    _cache.langNames = array_union(_cache.langNames, _langNames);
    _cache.langCount = array_length(_cache.langCodes);
    __LocalizeTrace(LOC_TRACE.VERBOSE, $"Database updated! Took {(get_timer()-_t)/1000}ms to load {_size/1024}KB");
    __LocalizeDebug();
    return 1;
}