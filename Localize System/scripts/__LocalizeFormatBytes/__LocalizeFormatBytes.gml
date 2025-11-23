// feather ignore all
///@ignore
function __LocalizeFormatBytes(_bytes) {
    if (_bytes < 1024) return $"{round(_bytes)} B";    
    var _kb = _bytes / 1024;
    if (_kb < 1024) return $"{string_format(_kb, 0, 2)} KB";
    var _mb = _kb / 1024;
    if (_mb < 1024) return $"{string_format(_mb, 0, 2)} MB";
    var _gb = _mb / 1024;
    return $"{string_format(_gb, 0, 2)} GB";
}