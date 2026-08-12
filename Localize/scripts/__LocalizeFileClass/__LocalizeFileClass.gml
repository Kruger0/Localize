// feather ignore all
/// @ignore
function __LocalizeFileClass(fileName, sheetId, sheetPage) constructor {
    self.fileName   = fileName;
    self.sheetId    = sheetId;
    self.sheetPage  = sheetPage;
    
    // ======================== State
    self.path       = filename_path(fileName);
    self.loaded     = false;
    self.requestId  = -1;
    self.size       = 0;
    self.timestamp  = 0;
    self.async      = false;
    self.hash       = undefined
    
    // ======================== Download
    self.progress   = 0;
}