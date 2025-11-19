/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeAsyncLoad(filename, callback, fileId) {
    static _cache = __LocalizeCache();
    var _loadBuffer = buffer_create(1, buffer_grow, 1)
    var _loadId = buffer_load_async(_loadBuffer, filename, 0, -1)
    array_push(_cache.asyncArray, [
          _loadId,
          _loadBuffer,
          callback,
          fileId,
    ])
}