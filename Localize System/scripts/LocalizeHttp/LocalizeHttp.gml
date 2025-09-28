
///@func LocalizeHttp()
///@desc Trace the sheet file download status. Call it in Async HTTP on your game manager object.
function LocalizeHttp() {
    var _cache = __LocalizeCache();
    var _result;
    var _async = json_parse(json_encode(async_load))
    if (_async[$ "id"] == _cache.requestId) {
        var _http = _async[$ "http_status"];
        if (_http == 200) {
            var _path = _async[$ "result"];
            __LocalizeTrace(LOC_TRACE.VERBOSE, _cache.traceMsg.dlGood, _path);
            __LocalizeUpdate();
            if (!GM_is_sandboxed && GM_build_type == "run") {
                // If its running from the IDE, the file will be automatically copyed to the project datafiles
                var _pathSrc = _cache.locPath + LOC_FILENAME + ".new";
                var _pathDst = filename_dir(GM_project_filename)+"/datafiles/"+LOC_FILENAME;
                file_copy(_pathSrc, _pathDst);
            }
        } else {
            __LocalizeTrace(LOC_TRACE.CRITICAL ,_cache.traceMsg.dlBad, _async[$ "http_status"]);
        }
    }
}
