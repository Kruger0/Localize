/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc e
function LocalizeFlush(){
    static _cache = __LocalizeCache();
    _cache.locDatabase = {};
}