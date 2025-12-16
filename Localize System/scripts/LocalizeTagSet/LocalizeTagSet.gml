// feather ignore all
/// @desc Defines a custom tag to be automatically replaced in localized strings.
/// @param {String} tag The tag string to search for.
/// @param {Any} value The value to replace the tag with.
function LocalizeTagSet(tag, value){
    static _cache = __LocalizeCache();
    static _func = function(name, lang) {
        lang.langCache = {};
    }
    
    with (_cache) {
        if (locTagKeys[$ tag] == string(value)) {
            return 0;
        } else {
            locTagKeys[$ tag] = string(value);
            if (!is_undefined(locDatabase)) {
                struct_foreach(locDatabase, _func);
            }
        }
    }
}