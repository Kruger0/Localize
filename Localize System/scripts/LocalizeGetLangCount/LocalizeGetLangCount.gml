/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the current language count loaded on the game.
function LocalizeGetLangCount() {
    return array_length(LocalizeGetLangs());
}