// feather ignore all
///@ignore
function __LocalizeFileClass(fileName, sheetId, sheetPage) constructor {
    self.fileName   = fileName;
    self.sheetId    = sheetId;
    self.sheetPage  = sheetPage;
    
    // ======================== Status
    self.loaded     = false;
    self.requestId  = -1;
    self.size       = -1;
    self.timestamp  = get_timer();
    self.async      = false;
    
    // ======================== Download
    self.progress   = 0;
}