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
    if (_asyncLoad[$ "id"] == _cache.requestId) {
        var _http = _asyncLoad[$ "http_status"];
        if (_http == 200) {
            var _path = _asyncLoad[$ "result"];
            __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.dlGood, string_replace_all(_path, "\\", "/"));
            __LocalizeUpdate();
            
            // If its running from the IDE without sandbox, copy sheet to the game datafiles
            if (!GM_is_sandboxed && GM_build_type == "run") {
                
                // If compress enbaled, obfuscate sheet using zlib compression
                var _buff = buffer_load(_path);
                if (LOC_COMPRESS) {
                    var _comp = buffer_compress(_buff, 0, buffer_get_size(_buff));
                    buffer_delete(_buff);
                    _buff = _comp;
                }
                buffer_save(_buff, _cache.pathDest);
                buffer_delete(_buff);
                
                __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.fileCopy, _cache.pathDest);
            }
        } else {
            __LocalizeTrace(LOC_TRACE.ERROR, _cache.traceMsg.dlBad, _asyncLoad[$ "http_status"]);
        }
    }
}