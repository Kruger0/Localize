// feather ignore all
/// @ignore
function __LocalizeCache() {
    static cache = undefined;
    if (is_undefined(cache)) {
        var _t = get_timer()
        var _savePath = "";
        if (GM_build_type == "run") {
            if (LOC_FORCE_BUNDLE_AREA && !GM_is_sandboxed) {
                var _projDir = filename_dir(GM_project_filename);
                if (_projDir != "") {
                    _savePath = _projDir + "/datafiles/";
                }
            }
        }
        var _osLang = os_get_language();
        if (_osLang != "") {
            var _osReg = os_get_region();
            if (_osReg != "") {
                _osLang += "-" + _osReg;
            }
        }
        var _fontFallback = font_add("localize_font_default.ttc", LOC_DEFAULT_FONT_SIZE, false, false, 32, 65535);
        
        cache = {
            // ======================== Data
            locDatabase     : undefined,
            locLangData     : undefined,
            locLangCode     : "",
            locLangName     : "",
            locFallData     : undefined,
            locFallCode     : "",
            osLangCode      : _osLang,
            
            // ======================== Tags
            locTagKeys      : {},
            
            // ======================== Languages
            langCodes       : [],
            langCount       : -1,
            langNames       : [],
            
            // ======================== Files
            savePath        : _savePath,
            readPath        : "",
            fetchAllowed    : __LocalizeFetchAllowed(),
            sandboxed       : GM_is_sandboxed,
            files           : [],
            asyncArray      : [],
            timesource      : -1,
            managerId       : -1,
            recursion       : 0,
            lastUpdate      : "Never",
            
            // ======================== Debugger
            dbgView         : pointer_null,
            dbgSections     : {},
            dbgMode         : false,
            
            // ======================== Fonts
            fontFallback    : _fontFallback,
            fontDefault     : _fontFallback,
            fontDefined     : {},
            fontCurrIndex   : undefined,
            fontCurrName    : font_get_fontname(_fontFallback),
            fontCurrAsset   : font_get_name(_fontFallback),
        }
        if (GM_build_type == "run" && debug_mode) {
            global.__LocalizeCache = cache;
        }
    }
    return cache;
}
