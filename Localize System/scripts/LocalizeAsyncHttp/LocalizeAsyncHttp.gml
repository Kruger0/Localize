/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Handles the sheet file download. Call it in Async HTTP event on your game manager object.
function LocalizeAsyncHttp() {
    var _cache      = __LocalizeCache();
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
    
    if (_fileId != -1) {
        var _http = _asyncLoad[$ "http_status"];
        if (_http == 200) {
            _cache.pathSource = string_replace_all(_asyncLoad[$ "result"], "\\", "/");
            __LocalizeTrace(LOC_TRACE.VERBOSE, _cache.traceMsg.dlGood, _cache.pathSource);
            var _fileName = filename_name(_cache.pathSource);
            var _pathDest = _cache.pathDest + _fileName;
            
            // Load the downloaded file
            __LocalizeUpdate(_fileId);
            
            // If its running from the IDE without sandbox, copy sheet to the game datafiles
            if (!GM_is_sandboxed && GM_build_type == "run") {
                var _buffer = buffer_load(_cache.pathSource);
                
                // If compress enbaled, obfuscate sheet using zlib compression
                if (LOC_COMPRESS) {
                    var _comp = buffer_compress(_buffer, 0, buffer_get_size(_buffer));
                    buffer_delete(_buffer);
                    _buffer = _comp;
                }
                
                buffer_save(_buffer, _pathDest);
                buffer_delete(_buffer);
                __LocalizeTrace(LOC_TRACE.VERBOSE, _cache.traceMsg.fileCopy, _pathDest);
            }
        } else {
            __LocalizeTrace(LOC_TRACE.CRITICAL, _cache.traceMsg.dlBad, _asyncLoad[$ "http_status"]);
        }
    }
}