// feather ignore all
/// @desc Enable or disable a specific language. Useful for locking languages in a menu (e.g. if translation is incomplete).
/// @param {String} language The strict language code (e.g. "en-US").
/// @param {Bool} enabled True to enable, False to disable.
/// @returns {Real} 1 on success, 0 on failure.
function LocalizeLangSetEnabled(language, enabled){
    static _cache = __LocalizeCache();
    if (is_undefined(_cache.locDatabase)) return 0;
    var _entry = _cache.locDatabase[$ language];
    if (!is_undefined(_entry)) {
        _entry.langEnabled = enabled;
        return 1;
    }
    __LocalizeTrace(LOC_TRACE.CRITICAL, $"Cannot set enabled state. Language '{language}' not found.");
    return 0;
}