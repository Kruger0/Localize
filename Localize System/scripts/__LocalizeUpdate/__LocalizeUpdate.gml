/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeUpdate(fileId) {
    static _cache = __LocalizeCache();
    var _file = _cache.files[fileId];
    
    // Validade buffer file
    var _buffer = undefined;
    
    // TODO read can be done first from save area, then for included files
    var _filePath = (GM_build_type == "run" ? _cache.savePath : "") + _file.fileName;
    if (file_exists(_filePath)) {
        if (LOC_ASYNC_MODE) {
            __LocalizeAsyncLoad(_filePath, __LocalizeHandleBuffer, fileId);
            return 1;
        } else {
            _buffer = buffer_load(_filePath);
        }
    } else {
        __LocalizeTrace(LOC_TRACE.CRITICAL, $"File '{_file.fileName}' does not exists on directory {_cache.savePath}");
        return 0;
    }
    
    // Buffer error checking
    if (_buffer == -1) {
        __LocalizeTrace(LOC_TRACE.CRITICAL, $"Failed to read file '{_file.fileName}'");
        return 0;
    }
    
    // Parse loaded buffer
    __LocalizeHandleBuffer(_buffer, true, fileId);
    
    return 1;
}