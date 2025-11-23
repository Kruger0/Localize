/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeLangEntry(langName, langCode) constructor{
  self.langName     = langName;
  self.langCode     = langCode;
  self.langKeys     = {};
  self.langEnabled  = true;
  self.langFont     = -1;
}