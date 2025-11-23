// feather ignore all
///@ignore
function __LocalizeLangClass(langCode) constructor{
  self.langCode     = langCode;
  self.langName     = langCode;
  
  // ======================== Data Storage
  self.langKeys     = {};
  
  // ======================== Settings
  self.langEnabled  = true;
  
  // ======================== Language Font
  self.langFontName = "";
  self.langFontId   = -1
}