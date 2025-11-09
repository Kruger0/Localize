/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeTrace(mode, msg) {
    if (mode <= LOC_TRACE_LEVEL) {
        var _string = "[Localize] " + msg;
        if (argument_count > 2) {
            var _args = [];
            for (var i = 2; i < argument_count; i++) {
                array_push(_args, argument[i]);
            }    
            if (array_length(_args) > 0) {
                _string = string_ext(_string, _args);
            }
        }
        show_debug_message(_string);
    }
}
