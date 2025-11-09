/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the current language count loaded on the game.
function LocalizeGetLangCount() {
    var _cache = __LocalizeCache();
    var _count = array_length(struct_get_names(_cache.gameTexts));
    return _count;
}