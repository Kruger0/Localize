// feather ignore all
/// @desc Returns the name of the currently active font asset.
/// @return {String} The font asset name (e.g. "fnt_Arial") or "None".
function LocalizeFontGetName() {
    static _cache = __LocalizeCache();
    return _cache.fontCurrAsset; 
}