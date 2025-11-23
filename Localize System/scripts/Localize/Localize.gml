// feather ignore all
/// @desc Returns the localized string for the given key, applying template arguments and tags.
/// @param {String} key The key defined in the translation file.
/// @param {Any} [val] Arguments to replace placeholders ({0}, {1}...) in the text.
/// @returns {String} The localized string
function Localize(key) {
    static _cache = __LocalizeCache();
    
    if (_cache.debugMode) return key;
    
    // Solve langData
    var _langData = _cache.locLangData;
    if (is_undefined(_langData)) {
        _langData = _cache.locFallData;
        if (is_undefined(_langData)) return key;
    }
    
    // Retrieve String
    var _string = _langData.langKeys[$ key];
    
    // Check if undefined or missing entry
    if (is_undefined(_string) || _string == "") {
        if (!is_undefined(_cache.locFallData)) {
            var _fallString = _cache.locFallData.langKeys[$ key];
            if (!is_undefined(_fallString) && _fallString != "") {
                _string = _fallString;
            }
        }
    }
    
    // Error Checking
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