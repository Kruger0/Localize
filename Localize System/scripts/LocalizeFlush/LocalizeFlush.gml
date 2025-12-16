// feather ignore all
/// @desc Completely clears all loaded languages, files, and cached data from memory.
function LocalizeFlush(){
    static _cache = __LocalizeCache();
    
    with (_cache) {
        // Reset data
        locDatabase = undefined; 
        locLangData = undefined;
        locLangCode = "";
        locFallData = undefined;
        locFallCode = "";

        // Reset tags
        locTagKeys  = {};
        
        // Reset Arrays
        langCodes   = [];
        langCount   = -1;
        langNames   = [];
        files       = [];
        langCache   = {};
        
        // Clear Async
        asyncArray  = []; 
        
        // Reset fonts
        for (var i = 0, n = array_length(definedFont); i < n; i++) {
            var _font = defaultFont[i];
            if (font_exists(_font)) {
                font_delete(_font)
            }
        }
    }
    __LocalizeTrace(LOC_TRACE.VERBOSE, "System flushed. All data cleared.");
}