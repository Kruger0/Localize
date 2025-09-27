///@func LocalizeText(key, val0, val1...)
///@desc Returns the localized text on the lang cache from a provided key and the values to replace in the string.
function LocalizeText(_key) {
    var _arr = [];
    
    // Read all args
    for (var i = 1; i < argument_count; i++) {
        _arr[i-1] = argument[i];
    }
    
    return LocalizeTextExt(_key, _arr);
}