/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Trace the sheet file download status. Call it in Async HTTP on your game manager object.
function LocalizeHttp() {
    var _cache = __LocalizeCache();
    var _result;
    var _async = json_parse(json_encode(async_load))
    if (_async[$ "id"] == _cache.requestId) {
        var _http = _async[$ "http_status"];
        if (_http == 200) {
            var _path = _async[$ "result"];
            __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.dlGood, string_replace_all(_path, "\\", "/"));
            __LocalizeUpdate();
            
            if (!GM_is_sandboxed && GM_build_type == "run") {
                
                // If its running from the IDE without sandbox, copy sheet to the game datafiles
                var _pathDst = filename_dir(GM_project_filename)+"/datafiles/"+LOC_FILENAME;
                
                // If compress enbaled, obfuscate sheet using zlib compression
                if (LOC_COMPRESS) {
                    var _buff = buffer_load(_path);
                    var _comp = buffer_compress(_buff, 0, buffer_get_size(_buff));
                    buffer_save(_comp, _pathDst);
                    buffer_delete(_buff);
                    buffer_delete(_comp);
                } else {
                    file_copy(_path, _pathDst);
                }
                
                __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.fileCopy, _pathDst);
            }
        } else {
            __LocalizeTrace(LOC_TRACE.ERROR, _cache.traceMsg.dlBad, _async[$ "http_status"]);
        }
    }
}