/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeSplitLang(lang) {
    var _langData = string_split(lang, "-");
    var _langName = _langData[0];
    var _langCode = "";
    switch (array_length(_langData)) {
        case 2: _langCode = _langData[1]; break;
        case 3: _langCode = _langData[1] + "-" + _langData[2]; break;
    }
    return [_langName, _langCode];
}