
///@ignore
function __LocalizeDownload(){
    var _cache = __LocalizeCache();
    // Credits to https://twitter.com/VINE2D for coming up with this
    var _link = $"https://docs.google.com/spreadsheets/d/{LOC_SHEET_ID}/export?format=csv&gid=0";
    var _isConnected = network_resolve("www.google.com") != "";
    var _path = _cache.locPath + LOC_FILENAME + ".new";
    //_path = filename_dir(GM_project_filename) + "/datafiles/localize.dat"
    if (_isConnected) {
        __LocalizeTrace(LOC_TRACE.VERBOSE, _cache.traceMsg.online);
        _cache.requestId = http_get_file(_link, _path);
        if (_cache.requestId == -1) {
            __LocalizeTrace(LOC_TRACE.CRITICAL, _cache.traceMsg.badRqst);
        }
    } else {
        __LocalizeTrace(LOC_TRACE.VERBOSE, _cache.traceMsg.offline);
        __LocalizeUpdate();
    }
}