
///@ignore
function __LocalizeUpdate() {
    var _cache = __LocalizeCache();
    
    // Check difference between old and new .dat file
    var _md5_old = md5_file(LOC_FILENAME);
    var _md5_new = md5_file(LOC_FILENAME + ".new")
    if (_md5_old == _md5_new) {
        file_delete(LOC_FILENAME + ".new");
    } else {
        if (file_exists(LOC_FILENAME + ".new")) {
            file_delete(LOC_FILENAME);
            file_rename(LOC_FILENAME + ".new", LOC_FILENAME);
        }
    }
    
    // Check if file is valid and load it to cache
    var _grid = load_csv(LOC_FILENAME);
    if (_grid == -1) {
        __LocalizeTrace(LOC_TRACE.CRITICAL, string(_cache.traceMsg.file404, LOC_FILENAME));
        _cache.locExists = false;
    } else {
        _cache.locExists = true;
        _cache.gameTexts = {};
    }
    
    // Parse sheet to text data
    if (_cache.locExists) {
        var _w = ds_grid_width(_grid);
        var _h = ds_grid_height(_grid);
        
        // Process languages
        var _langNames = [];
        var _langCodes = [];
        for (var i = 1; i < _w; i++) {
            var _langString = _grid[# i, 0];
            var _langData = string_split(_langString, "-");
            var _langName = _langData[0];
            var _langCode = (array_length(_langData) > 2 ? _langData[1] + "-" + _langData[2] : _langData[1]);
            array_push(_langNames, _langName);
            array_push(_langCodes, _langCode);
        }
        _cache.langNames = _langNames;
        _cache.langCodes = _langCodes;
        
        // Process texts
        for (var i = 1; i < _h; i++) {
            var _texts = [];
            var _tags = _cache.tags;
            for (var j = 1; j < _w; j++) {
                var _text = _grid[# j, i]
                _text = string_replace_all(_text, "\\n", "\n");
                _text = string_replace_all(_text, "\\r", "\r");
                //for (var k = 0; k < array_length(_tags); k++) {
                //    _text = string_replace_all(_text, _tags[k][0], _tags[k][1]);
                //}                
                _texts[j-1] = _text;
            }
            
            var _key = _grid[# 0, i];
            if (_key == "") {
                _key = LOC_MISSING_KEY;
            }
            _cache.gameTexts[$ _key] = _texts;
        }
        ds_grid_destroy(_grid);
        if (LOC_AUTO_DETECT) LocalizeDetectLang();
        __LocalizeTrace(LOC_TRACE.VERBOSE, _cache.traceMsg.updtGood);
    }
    
    __LocalizeDebug();
}
