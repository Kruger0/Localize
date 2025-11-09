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
    var _lang   = _cache.gameLang;
    
    // Get localized string
    var _langKeys = _cache.gameTexts[$ _lang].langKeys; // TODO cache this?
    var _string = _langKeys[$ key]; // _cache.langKeys[$ key]; // TODO WIP
    
    // Key translation missing. Use fallback
    if (is_undefined(_string)) {
        _string = _cache.langFallback[$ key];
        
        // Fallback translation not found
        if (is_undefined(_string)) {
            return string(_cache.traceMsg.trns404, key, $"{_lang}");
        }
    }
    
    // Handle string templates
    var _args = [];
    for (var i = 1; i < argument_count; i++) {
        array_push(_args, argument[i]);
    }    
    if (array_length(_args) > 0) {
        _string = string_ext(_string, _args);
    }
    
    // Check for tag replacement
    var _tagStart = string_pos("[", _string);
    if (_tagStart >= 1) {
        var _tagArr = struct_get_names(_cache.tags);
        var _tagLen = array_length(_tagArr);
        for (var i = 0; i < _tagLen; i++) {
            var _tagName = _tagArr[i];
            
            if (string_pos(_tagName, _string) >= 1) {
                var _tagValue = _cache.tags[$ _tagName];
                _string = string_replace_all(_string, _tagName, _tagValue);
            }
        } 
    }
    
    return _string;
}