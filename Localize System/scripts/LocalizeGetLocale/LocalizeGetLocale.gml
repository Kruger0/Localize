/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the system language & region code in the ISO format (en-US)
function LocalizeGetLocale() {
    var _region     = os_get_region();
    var _language   = os_get_language();
    return _language + (_region == "" ? "" : "-" + _region);
}