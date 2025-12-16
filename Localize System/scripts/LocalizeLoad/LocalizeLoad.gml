// feather ignore all
/// @desc Loads a translation file and optionally queues an automatic update from Google Sheets.
/// @param {String} fileName The path to the local .csv file.
/// @param {String} [sheetId] The Google Sheet ID for online fetching.
/// @param {String} [sheetPage] The specific sheet page GID. Defaults to "0"
/// @returns {Real} The internal file ID on success, or -1 on failure/duplicate.
function LocalizeLoad(fileName, sheetId = undefined, sheetPage = "0"){
    static _cache = __LocalizeCache();
    
    // Check duplicated file loading
    for (var i = 0; i < array_length(_cache.files); i++) {
        var _file = _cache.files[i];
        if (fileName == _file.fileName) {
            __LocalizeTrace(LOC_TRACE.VERBOSE, $"File '{fileName}' already loaded (same file name)");
            return 0;
        } else
        if (sheetId == _file.sheetId && sheetPage == _file.sheetPage) {
            __LocalizeTrace(LOC_TRACE.VERBOSE, $"File '{fileName}' already loaded (same sheet id)");
            return 0;
        }
    }
    
    // Register file entry
    array_push(_cache.files, new __LocalizeFileClass(fileName, sheetId, sheetPage));
    var _fileId = array_length(_cache.files) - 1;
    __LocalizeUpdate(_fileId);
    if (!is_undefined(sheetId) && __LocalizeFetchAllowed()) {
        __LocalizeDownload(_fileId);
    } else {
        if (is_undefined(sheetId)) {
            __LocalizeTrace(LOC_TRACE.VERBOSE, $"Loaded local-only file '{fileName}'.");
        } else {
            __LocalizeTrace(LOC_TRACE.VERBOSE, $"Online fetch skipped for '{fileName}' (Config or Platform restriction).");
        }
    }
    return _fileId;
}