/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeAsyncHttp() {
    static _cache   = __LocalizeCache();
    var _asyncLoad  = json_parse(json_encode(async_load));
    
    // Check for what file are we handling
    var _fileId = -1;
    for (var i = 0; i < array_length(_cache.files); i++) {
        var _file = _cache.files[i];
        if (_file.requestId == _asyncLoad[$ "id"]) {
            _fileId = i;
            break;
        }
    }
    
    // If we found the file ID, process it
    if (_fileId != -1) {
        switch (_asyncLoad[$ "status"]) {
            case 1:
                //__LocalizeTrace(LOC_TRACE.VERBOSE, $"Downloading '{_file.fileName}' - {_asyncLoad[$ "sizeDownloaded"]/1024}KB");
                break;
            case  0:
            case -1:
                var _http = _asyncLoad[$ "http_status"];
                var _result = string_replace_all(_asyncLoad[$ "result"], "\\", "/");
                if (_http == 200) {
                    // Load the downloaded file
                    __LocalizeUpdate(_fileId);
                    __LocalizeTrace(LOC_TRACE.VERBOSE, $"Sheet downloaded at '{_result}'");
                } else {
                    file_delete(_result);
                    __LocalizeTrace(LOC_TRACE.CRITICAL, $"HTTP request failed: '{_http}'. Check the sheet URL, Page ID, or access permissions");
                }
                break;
        }
    }
}