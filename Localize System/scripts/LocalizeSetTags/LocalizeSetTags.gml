/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Defines a custom tag to be replaced by any value
function LocalizeSetTag(tag, value){
    var _cache = __LocalizeCache();
    _cache.locTags[$ tag] = string(value);
}