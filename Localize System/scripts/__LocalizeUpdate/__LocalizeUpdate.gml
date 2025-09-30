/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeUpdate() {
    var _cache = __LocalizeCache();
    
    // Validade buffer file
    var _buffer = undefined;
    var _dataFile = program_directory + LOC_FILENAME;
    if (file_exists(_dataFile)) {
        if (LOC_ASYNC_MODE) {
            __LocalizeSaveLoad(_dataFile, __LocalizeHandleBuffer);
            return 1;
        } else {
            _buffer = buffer_load(_dataFile);
        }
    } else if (file_exists(LOC_FILENAME)) {
        if (LOC_ASYNC_MODE) {
            __LocalizeSaveLoad(LOC_FILENAME, __LocalizeHandleBuffer);
            return 1;
        } else {
            _buffer = buffer_load(LOC_FILENAME);
        }
    } else {
        __LocalizeTrace(LOC_TRACE.ERROR, _cache.traceMsg.file404, LOC_FILENAME);
        return 0;
    }
    if (_buffer == -1) {
        return 0;
    }
    
    __LocalizeHandleBuffer(_buffer, true);
    
    return 1;
}