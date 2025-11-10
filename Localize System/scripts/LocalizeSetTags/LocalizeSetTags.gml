/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Defines a custom tag to be replaced by any value
function LocalizeSetTag(tag, value){
    static _cache = __LocalizeCache();
    _cache.locTagKeys[$ tag] = string(value);
    _cache.locTagNames = struct_get_names(_cache.locTagKeys);
    _cache.locTagCount = array_length(_cache.locTagNames);
}