// feather ignore all
///@ignore
function __LocalizeAsyncHttp() {
    static _cache   = __LocalizeCache();
    
    // Check for what file are we handling
    var _id     = async_load[? "id"];
    var _fileId = -1;
    var _file   = undefined;
    
    var _len = array_length(_cache.files);
    for (var i = 0; i < _len; i++) {
        var _f = _cache.files[i];
        if (_f.requestId != -1 && _f.requestId == _id) {
            _fileId = i;
            _file = _f;
            break;
        }
    }
    
    // If we found the file ID, process it
    if (_fileId != -1) {
        var _status = async_load[? "status"];
        
        // Downloading file
        if (_status == 1) {
            var _size = async_load[? "sizeDownloaded"];
            if (LOC_DOWNLOAD_LOG_ENABLED && _size > 0) {
                if (_size > _file.progress + LOC_DOWNLOAD_LOG_INTERVAL) {
                    _file.progress = _size;
                    __LocalizeTrace(LOC_TRACE.VERBOSE, $"Downloading '{_file.fileName}' - {__LocalizeFormatBytes(_size)}");
                }
            }
            return;
        }
        _file.requestId = -1;
        var _httpStatus = async_load[? "http_status"];
        var _resultPath = _cache.savePath + _file.fileName;
        if (_httpStatus == 200 && file_exists(_resultPath)) {
            __LocalizeUpdate(_fileId);
            if (LOC_COMPRESS && GM_build_type == "run") {
                var _buffer = buffer_load(_resultPath);
                if (buffer_exists(_buffer)) {
                    var _comp = buffer_compress(_buffer, 0, buffer_get_size(_buffer));
                    buffer_save(_comp, _resultPath);
                    buffer_delete(_buffer);
                    buffer_delete(_comp);
                    
                    __LocalizeTrace(LOC_TRACE.VERBOSE, $"Downloaded and compressed '{_file.fileName}'");
                }
            } else {
                __LocalizeTrace(LOC_TRACE.VERBOSE, $"Downloaded '{_file.fileName}'");
            }
        } else {
            if (file_exists(_resultPath)) file_delete(_resultPath);
            if (_status < 0) {
                 __LocalizeTrace(LOC_TRACE.CRITICAL, $"Connection failed for '{_file.fileName}' (Async Status: {_status})");
            } else {
                 __LocalizeTrace(LOC_TRACE.CRITICAL, $"HTTP request failed (Status: {_httpStatus}). Check Sheet URL/Permissions");
            }
        }
    }
}