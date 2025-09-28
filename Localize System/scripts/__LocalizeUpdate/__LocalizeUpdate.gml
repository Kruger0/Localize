
///@ignore
function __LocalizeUpdate() {
    var _cache  = __LocalizeCache();
    var _buffer = buffer_load(LOC_FILENAME); // TODO make this async
    
    // Check for sheet compression
    var _header = buffer_read(_buffer, buffer_u16);
    if (_header == 0x9C78) { // zlib default compression header
        var _decomp = buffer_decompress(_buffer);
        buffer_delete(_buffer);
        _buffer = _decomp;
        buffer_seek(_buffer, buffer_seek_start, 0);
    }
    
    // Load buffer to memory
    var _sheet = __LocalizeLoadCsv(_buffer);
    buffer_delete(_buffer);
    if (array_length(_sheet) == 0) {
        __LocalizeTrace(LOC_TRACE.CRITICAL, string(_cache.traceMsg.file404, LOC_FILENAME));
        _cache.locExists = false;
    } else {
        _cache.locExists = true;
        _cache.gameTexts = {};
    }
    
    // Process languages
    var _langNames = [];
    var _langCodes = [];
    for (var i = 1; i < array_length(_sheet[0]); i++) {
        var _langString = _sheet[0, i];
        var _langData = string_split(_langString, "-");
        var _langName = _langData[0];
        var _langCode = "";
        switch (array_length(_langData)) {
            case 2: _langCode = _langData[1]; break;
            case 3: _langCode = _langData[1] + "-" + _langData[2]; break;
        }
        array_push(_langNames, _langName);
        array_push(_langCodes, _langCode);
    }
    _cache.langNames = _langNames;
    _cache.langCodes = _langCodes;
    
    // Process texts
    for (var i = 1; i < array_length(_sheet); i++) {
        var _texts = [];
        var _line = _sheet[i];
        var _key = _line[0];
        for (var j = 1; j < array_length(_line); j++) {
            var _text = _sheet[i, j]
            
            // Replace linebreaks
            _text = string_replace_all(_text, "\\n", "\n");
            _text = string_replace_all(_text, "\\r", "\r");
            
            
            _texts[j-1] = _text;
        }
        _cache.gameTexts[$ _key] = _texts;
    }
    
    // Finish process
    __LocalizeTrace(LOC_TRACE.VERBOSE, _cache.traceMsg.updtGood);
    __LocalizeDebug();
}