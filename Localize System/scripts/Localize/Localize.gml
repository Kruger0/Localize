/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the localized text on the language cache from a provided key, and the values to replace in the string template.
function Localize(key) {
    var _cache  = __LocalizeCache();
    
    var _langData = _cache.locLangData;
    // If missing data, use fallback
    if (is_undefined(_langData)) {
        _langData = _cache.locFallData;
        if (is_undefined(_langData)) return key;
    }
    
    var _string = _langData.langKeys[$ key];
    // If missing translation, use fallback
    if (is_undefined(_string)) {
        _string = _cache.locFallData.langKeys[$ key];
        if (is_undefined(_string)) return key;
    }
    
    // Handle string templates
    if (argument_count > 1) {
        var _args = [];
        for (var i = 1; i < argument_count; i++) {
            array_push(_args, argument[i]);
        }    
        _string = string_ext(_string, _args);
    }
    
    // Check for tag replacement
    var _tagStart = string_pos("[", _string);
    if (_tagStart >= 1) {
        var _tagArr = struct_get_names(_cache.locTags);
        var _tagLen = array_length(_tagArr);
        for (var i = 0; i < _tagLen; i++) {
            var _tagName = _tagArr[i];
            
            if (string_pos(_tagName, _string) >= 1) {
                var _tagValue = _cache.locTags[$ _tagName];
                _string = string_replace_all(_string, _tagName, _tagValue);
            }
        } 
    }
    
    return _string;
}