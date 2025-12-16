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
        locTagNames = [];
        locTagCount = 0;
        
        // Reset Arrays
        langCodes   = [];
        langCount   = -1;
        langNames   = [];
        files       = [];
        langCache   = {};
        
        // Clear Async
        asyncArray  = []; 
    }
    __LocalizeTrace(LOC_TRACE.VERBOSE, "System flushed. All data cleared.");
}