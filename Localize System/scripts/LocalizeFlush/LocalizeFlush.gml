// feather ignore all
/// @desc Completely clears all loaded languages, files, and cached data from memory.
function LocalizeFlush(){
    static _cache = __LocalizeCache();
    static _func  = function(name, value) {
        if (string_pos(":", name)) {
            if (font_exists(value)) {
                font_delete(value);
            }
        }
    }
    
    with (_cache) {
        // ======================== Data
        locDatabase = undefined; 
        locLangData = undefined;
        locFallData = undefined;
        locFallCode = "";
        
        // ======================== Tags
        locTagKeys  = {};
        
        // ======================== Languages
        langCodes   = [];
        langCount   = -1;
        langNames   = [];
        
        // ======================== Fonts
        struct_foreach(definedFont, _func);
        defaultFont = __LocalizeFontDefault;
        currentFont = undefined;
        recursion   = 0;
        
        // ======================== Files
        asyncArray  = []; 
        for (var i = 0, n = array_length(files); i < n; i++) {
            var _file = files[i];
            with (_file) {
                loaded     = false;
                requestId  = -1;
                size       = 0;
                timestamp  = get_timer();
                async      = false;
                hash       = undefined
            }
        }
    }
    __LocalizeDebug();
    __LocalizeTrace(LOC_TRACE.VERBOSE, "System flushed");
}
