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
    var _string = "";
    var _lang   = _cache.gameLang;
    
    if (LocalizeGetLangCount() < 1) return 0; // TODO is this the best fallback method?
    
    // Get localized string
    var _langs = __LocalizeCache().gameTexts[$ key];
    if (is_array(_langs)) {
        if (array_length(_langs) > _lang) {
            
            var _args = [];
            for (var i = 1; i < argument_count; i++) {
                array_push(_args, argument[i]);
            }
            
            if (array_length(_args) > 0) {
                _string = string_ext(_langs[_lang], _args);
            } else {
                _string = _langs[_lang];
            }
        }
    }
    
    // Key failsafe
    if (_string == "") {
        _string = string(_cache.traceMsg.trns404, key, _cache.langNames[_lang]);
    }
    
    // Apply text tags
    var _tagArr = struct_get_names(_cache.tags);
    var _tagLen = array_length(_tagArr);
    for (var i = 0; i < _tagLen; i++) {
        var _tagName = _tagArr[i];
        var _tagValue = _cache.tags[$ _tagName];
        _string = string_replace_all(_string, _tagName, _tagValue);
    }
    
    return _string;
}