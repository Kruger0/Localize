/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns an array containing the languages actives in the game.
function LocalizeGetLangs() {
    return __LocalizeCache().languages;
}