// feather ignore all
/// @desc Defines a custom tag to be automatically replaced in localized strings.
/// @param {String} tag The tag string to search for (e.g. "[icon]").
/// @param {Any} value The value to replace the tag with.
function LocalizeTagSet(tag, value){
    static _cache = __LocalizeCache();
    static _func = function(_name, _lang) {
        _lang.langCache = {};
    }
    _cache.locTagKeys[$ tag] = string(value);
    _cache.locTagNames = variable_struct_get_names(_cache.locTagKeys);
    _cache.locTagCount = array_length(_cache.locTagNames);
    
    if (!is_undefined(_cache.locDatabase)) {
        struct_foreach(_cache.locDatabase, _func);
    }
}