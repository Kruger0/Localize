/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the current language count loaded on the game.
function LocalizeGetLangCount() {
    static _cache = __LocalizeCache();
    return _cache.langCount;
}