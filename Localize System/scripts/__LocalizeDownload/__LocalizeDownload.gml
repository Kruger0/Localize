
function __LocalizeDownload(){
    // Credits to https://twitter.com/VINE2D for coming up with this
    var _link = $"https://docs.google.com/spreadsheets/d/{LOC_SHEET_ID}/export?format=csv&id={LOC_SHEET_ID}&gid=0";
    var _path = __LocalizeCache().locPath + LOC_FILENAME;
    __LocalizeCache().requestId = http_get_file(_link, _path);
}