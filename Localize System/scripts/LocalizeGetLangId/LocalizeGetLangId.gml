/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the current game language as a numeric id.
function LocalizeGetLangId() {
    return __LocalizeCache().gameLang;
}