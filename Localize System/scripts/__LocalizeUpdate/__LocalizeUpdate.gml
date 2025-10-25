/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeUpdate(fileId) {
    var _cache = __LocalizeCache();
    var _file  = _cache.files[fileId];
    
    // Validade buffer file
    var _buffer     = undefined;
    var _localFile  = _file.fileName;
    var _dataFile   = program_directory + _localFile; // TODO check if this works on all platforms
    if (file_exists(_dataFile)) {
        if (LOC_ASYNC_MODE) {
            __LocalizeAsyncLoad(_dataFile, __LocalizeHandleBuffer);
            return 1;
        } else {
            _buffer = buffer_load(_dataFile);
        }
    } else if (file_exists(_localFile)) {
        if (LOC_ASYNC_MODE) {
            __LocalizeAsyncLoad(_localFile, __LocalizeHandleBuffer);
            return 1;
        } else {
            _buffer = buffer_load(_localFile);
        }
    } else {
        __LocalizeTrace(LOC_TRACE.ERROR, _cache.traceMsg.file404, _localFile);
        return 0;
    }
    if (_buffer == -1) {
        return 0;
    }
    
    // Parse loaded buffer
    __LocalizeHandleBuffer(_buffer, true);
    
    return 1;
}