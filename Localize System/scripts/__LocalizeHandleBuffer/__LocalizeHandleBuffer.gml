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
        __LocalizeTrace(LOC_TRACE.ERROR, _cache.traceMsg.file404, status)
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
        __LocalizeTrace(LOC_TRACE.ERROR, string(_cache.traceMsg.file404, -1)); // TODO pass a file here?
        return 0;
    } else {
        //_cache.gameTexts = {};
    }
    
    // Process languages
    _cache.texts = {}
    var _langNames = [];
    var _langCodes = [];
    
    // Iterate rows
    for (var i = 0; i < array_length(_sheet); i++) {
        var _line = _sheet[i];
        
        
        // Iterate cols
        for (var j = 0; j < array_length(_line); j++) {
            var _cell = _line[j];
        }
        
        // TODO iraaaaaaaa
        
        var _langString = _sheet[0, i];
        var _langData = string_split(_langString, LOC_CODE_DELIM);
        var _langName = _langData[0];
        var _langCode = "";
        if (array_length(_langData) > 1) {
            _langCode = _langData[1]; 
        } else {
            // TODO use lookup ISO code
            _langCode = _langName;
        }
        array_push(_langNames, _langName);
        array_push(_langCodes, _langCode);
        
        _cache.texts[$ _langCode] ??= {
            langName: _langName,
            langKeys: {},
        }
    }
    _cache.langNames = _langNames;
    _cache.langCodes = _langCodes;
    
    // Process texts
    for (var i = 1; i < array_length(_sheet); i++) {
        var _texts = [];
        var _line = _sheet[i];
        var _key = _line[0];
        for (var j = 1; j < array_length(_line); j++) {
            var _text = _sheet[i, j];
            
            // Replace linebreaks for a new line
            if (LOC_REPLACE_NEWLINE) {
                _text = string_replace_all(_text, "\\n", "\n");
                _text = string_replace_all(_text, "\\r", "\r");
            }
            
            _texts[j-1] = _text;
        }
        _cache.gameTexts[$ _key] ??= _texts;
    }
    
    // Finish process
    __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.updtGood);
    __LocalizeDebug();
    return 1;
}