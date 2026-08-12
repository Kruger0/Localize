// feather ignore all
/// @ignore
function __LocalizeDownload(fileId){
    static _cache = __LocalizeCache();
    var _file = _cache.files[fileId];
    
    // Credits to VINE for coming up with this
    // https://marketplace.gamemaker.io/assets/11499/automatic-google-sheets-downloader
    var _url = $"https://docs.google.com/spreadsheets/d/{_file.sheetId}/export?format=csv&gid={_file.sheetPage}";
    
    var _isConnected = os_is_network_connected(network_connect_passive);
    if (os_type == os_gxgames || os_browser != browser_not_a_browser) _isConnected = true;
    
    if (_isConnected) {
        __LocalizeTrace(LOC_TRACE.VERBOSE, $"Downloading file '{_file.fileName}'...");
        _file.requestId = http_get_file(_url, _cache.savePath + _file.fileName);
        _file.timestamp = get_timer();
    } else {
        __LocalizeTrace(LOC_TRACE.VERBOSE, $"No internet internet connection. Using local file '{_file.fileName}'");
    }
}