/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeHandleBuffer(buffer, status) {
    var _cache = __LocalizeCache();
    
    if !(status) {
        __LocalizeTrace(LOC_TRACE.CRITICAL, _cache.traceMsg.file404, status)
    }
    
    // Check for sheet compression
    var _header = buffer_read(buffer, buffer_u16);
    if (_header == 0x9C78) { // zlib default compression header
        var _decomp = buffer_decompress(buffer);
        buffer_delete(buffer);
        buffer = _decomp;
        buffer_seek(buffer, buffer_seek_start, 0);
    }
    
    // Load buffer to memory
    var _sheet = __LocalizeLoadCsv(buffer);
    buffer_delete(buffer);
    if (array_length(_sheet) == 0) {
        __LocalizeTrace(LOC_TRACE.CRITICAL, string(_cache.traceMsg.file404, -1)); // TODO pass a file here?
        return 0;
    }
    
    // Iterate rows
    var _langCode = ""; 
    for (var i = 0; i < array_length(_sheet); i++) {
        var _line = _sheet[i];
        // Iterate cols
        for (var j = 0; j < array_length(_line); j++) {
            var _cell = _line[j];
            
            // Store language
            if (i == 0 && j > 0) {
                var _langData = string_split(_cell, LOC_CODE_DELIM);
                var _langName = _langData[0];
                if (array_length(_langData) > 1) {
                    _langCode = _langData[1]; 
                } else {
                    _langCode = _langName; // TODO use lookup ISO code ? nah let the user handle that
                }
                // Override array cell
                _line[j] = _langCode;
                
                // Store text on language key TODO trace when new language is defined
                _cache.langData[$ _langCode] ??= {
                    langName: _langName,
                    langKeys: {},
                };
            }
            
            // Store translations
            if (i > 0 && j > 0) {
                var _key = _line[0];
                _langCode = _sheet[0][j];
                // Replace escaped linebreaks for real ones
                if (LOC_REPLACE_NEWLINE) {
                    _cell = string_replace_all(_cell, "\\n", "\n");
                    _cell = string_replace_all(_cell, "\\r", "\r");
                }
                _cache.langData[$ _langCode].langKeys[$ _key] ??= _cell; // TODO option to replace new entries?
            }
        }
    }
    
    // Finish process
    __LocalizeTrace(LOC_TRACE.VERBOSE, _cache.traceMsg.updtGood);
    __LocalizeDebug();
    return 1;
}