
///@ignore
function __LocalizeAsyncSave(buffer, status) {
    var _buff = buffer_load(_path);
    if (LOC_COMPRESS) {
        var _comp = buffer_compress(_buff, 0, buffer_get_size(_buff));
        buffer_delete(_buff);
        _buff = _comp;
    }
    buffer_save(_buff, _pathDst);
    buffer_delete(_buff);
}