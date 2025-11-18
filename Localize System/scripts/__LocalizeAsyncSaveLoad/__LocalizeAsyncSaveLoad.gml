/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeAsyncSaveLoad() {
    static _cache   = __LocalizeCache();
    var _asyncLoad  = json_parse(json_encode(async_load));
    var _asyncArray = _cache.asyncArray;
    for (var _i = 0; _i < array_length(_asyncArray); ++_i) {
        var _asyncData = _asyncArray[_i];
        if (_asyncData[0] == _asyncLoad.id) {
            if (is_callable(_asyncData[2])) {
                _asyncData[2](_asyncData[1], _asyncLoad.status);
            }
            buffer_delete(_asyncData[1]);
            array_delete(_asyncArray, _i, 1);
        }
    }
}