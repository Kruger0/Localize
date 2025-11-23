/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeLangClass(langName, langCode) constructor{
  self.langName     = langName;
  self.langCode     = langCode;
  
  // ======================== Data Storage
  self.langKeys     = {};
  
  // ======================== Settings
  self.langEnabled  = true;
  self.langFont     = -1;
}