
///@ignore
function __LocalizeUpdate() {
    __LocalizeCache().gameTexts = {};
    var _grid = load_csv(LOC_FILENAME);
    if (_grid == -1) {
        __LocalizeTrace(__LOC_DEBUG.CRITICAL, string(__LocalizeCache().traceMsg.file404, LOC_FILENAME));
        __LocalizeCache().locExists = false;
    } else {
        __LocalizeCache().locExists = true;
    }
    
    if (__LocalizeCache().locExists) {
        var _w = ds_grid_width(_grid);
        var _h = ds_grid_height(_grid);

        for (var i = 0; i < _h; i++) {
            var _texts = [];
            var _tags = __LocalizeCache().tags;
            for (var j = 1; j < _w; j++) {
                var _text = _grid[# j, i]
                for (var k = 0; k < array_length(_tags); k++) {
                    _text = string_replace_all(_text, _tags[k][0], _tags[k][1]);
                }                
                _texts[j-1] = _text
            }
            var _key = _grid[# 0, i];
            if (_key == "") {
                _key = LOC_MISSING_KEY;
            }
            __LocalizeCache().gameTexts[$ _key] = _texts;
        }
        ds_grid_destroy(_grid);
        if (LOC_AUTO_DETECT) LocalizeDetectLang();
        __LocalizeTrace(__LOC_DEBUG.VERBOSE, __LocalizeCache().traceMsg.updtGood);
    }    
    
    __LocalizeDebug();
}
