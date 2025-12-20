// feather ignore all
/// @desc Completely clears all loaded languages, files, and cached data from memory.
function LocalizeFlush(){
    static _cache = __LocalizeCache();
    
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
        var _keys = struct_get_names(fontDefined);
        for (var i = 0; i < array_length(_keys); i++) {
            var _key = _keys[i];
            var _font = fontDefined[$ _key];
            if (string_pos(":", _key)) {
                if (font_exists(_font)) {
                    font_delete(_font);
                }
            }
        }
        fontDefault = fontFallback;
        fontCurrent = undefined;
        recursion   = 0;
        
        // ======================== Files
        asyncArray  = [];
        lastUpdate  = "Never";
        for (var i = 0, n = array_length(files); i < n; i++) {
            var _file = files[i];
            with (_file) {
                loaded     = false;
                requestId  = -1;
                size       = 0;
                timestamp  = 0;
                async      = false;
                hash       = undefined
            }
        }
    }
    __LocalizeDebug();
    __LocalizeTrace(LOC_TRACE.VERBOSE, "System flushed");
}
