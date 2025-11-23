/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the localized text on the language cache from a provided key, and the values to replace in the string template.
function Localize(key) {
    static _cache  = __LocalizeCache();
    
    if (_cache.debugMode) return key;
    
    // Solve langData
    var _langData = _cache.locLangData;
    if (is_undefined(_langData)) {
        _langData = _cache.locFallData;
        if (is_undefined(_langData)) return key;
    }
    
    // Validate key data
    var _string = _langData.langKeys[$ key];
    if (is_undefined(_string)) {
        if (!is_undefined(_cache.locFallData)) {
            _string = _cache.locFallData.langKeys[$ key];
        }
    }
    if (__LocalizeDetectCellError(_string)) return key;
    
    // Handle string templates
    if (argument_count > 1) {
        var _count = argument_count - 1;
        var _args = array_create(_count);
        for (var i = 0; i < _count; i++) {
            _args[i] = argument[i + 1];
        }
        _string = string_ext(_string, _args);
    }
    
    // Check for tag replacement
    if (string_pos("[", _string) != 0) {
        var _names = _cache.locTagNames;
        var _count = _cache.locTagCount;
        var _keys  = _cache.locTagKeys;
        
        for (var i = 0; i < _count; i++) {
            var _tagName = _names[i];
            if (string_pos(_tagName, _string) != 0) {
                _string = string_replace_all(_string, _tagName, _keys[$ _tagName]);
            }
        } 
    }
    return _string;
}