
///@desc Defines a custom tag to be replaced by any value
function LocalizeSetTag(tag, value){
    var _cache = __LocalizeCache();
    _cache.tags[$ tag] = string(value);
}