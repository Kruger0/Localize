/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns a list of loaded files and their respective Google Sheets IDs
function LocalizeGetFiles(){
    static _cache = __LocalizeCache();
    return _cache.files;
}