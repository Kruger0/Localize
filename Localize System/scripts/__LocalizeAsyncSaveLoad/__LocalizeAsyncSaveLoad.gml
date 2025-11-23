// feather ignore all
///@ignore
function __LocalizeAsyncSaveLoad() {
    static _cache   = __LocalizeCache();
    var _asyncArray = _cache.asyncArray;
    var _id = async_load[? "id"];
    var _status = async_load[? "status"];
    for (var _i = 0; _i < array_length(_asyncArray); ++_i) {
        var _asyncData = _asyncArray[_i];
        if (_asyncData[0] == _id) {
            var _buffer     = _asyncData[1];
            var _callback   = _asyncData[2];
            var _fileId     = _asyncData[3];
            array_delete(_asyncArray, _i, 1);
            
            if (is_callable(_callback)) {
                _callback(_buffer, _status, _fileId);
            }
            
            if (!_status) {
                if (buffer_exists(_buffer)) buffer_delete(_buffer);
            }
            return;
        }
    }
}