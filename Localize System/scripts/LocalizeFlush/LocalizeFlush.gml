/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Flush
function LocalizeFlush(){
    static _cache = __LocalizeCache();
    with (_cache) {
        locDatabase = undefined;
        locLangData = undefined;
        locLangCode = "";
        locFallData = undefined;
        locFallCode = "";
        osLangCode  = "";
        locTagKeys  = {};
        locTagNames = [];
        locTagCount = 0;
        langCodes   = [];
        langCount   = -1;
        langNames   = [];
        files       = [];
    }
}