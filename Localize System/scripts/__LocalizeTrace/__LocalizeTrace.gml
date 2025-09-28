
///@ignore
function __LocalizeTrace(mode, msg) {
    if (LOC_TRACE_LEVEL == LOC_TRACE.DISABLED) return 0;
    if (mode <= LOC_TRACE_LEVEL) {
        for (var i = 2; i < argument_count; i++) {
            var _substr = "{" + string(i - 2) + "}";
            var _newstr = string(argument[i]);
            msg = string_replace_all(msg, _substr, _newstr);
        }
        
        show_debug_message($"[Localize] {msg}");
    }
    return 1;
}

