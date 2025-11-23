/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeFileEntry(fileName, sheetId, sheetPage) constructor {
    self.fileName   = fileName;
    self.sheetId    = sheetId;
    self.sheetPage  = sheetPage;
    self.requestId  = -1;
    self.async      = false;
    self.timestamp  = get_timer();
    self.size       = -1;
    self.loaded     = false;
}