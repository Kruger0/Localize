
///@ignore
function __LocalizeUpdate() {

    __LocCache().gameTexts = {};
    var _grid = load_csv(LOC_FILENAME);
    if (_grid == -1) {
        __LocTrace(LOC_DEBUG.CRITICAL, string(__LocCache().traceMsg.file404, LOC_FILENAME));
        __LocCache().locExists = false;
    } else {
        __LocCache().locExists = true;
    }
    
    if (__LocCache().locExists) {
        var _w = ds_grid_width(_grid);
        var _h = ds_grid_height(_grid);

        for (var i = 0; i < _h; i++) {
            var _texts = [];
            var _tags = __LocCache().tags;
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
            __LocCache().gameTexts[$ _key] = _texts;
        }
        ds_grid_destroy(_grid);
        if (LOC_AUTO_DETECT) LocalizeDetectLang();
        __LocTrace(LOC_DEBUG.VERBOSE, __LocCache().traceMsg.updtGood);
    }    
    
    __loc_debug();
}
