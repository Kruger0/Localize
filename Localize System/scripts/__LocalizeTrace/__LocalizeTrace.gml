
///@ignore
function __LocalizeTrace(mode, msg, value = undefined) {
    if (LOC_TRACE_LEVEL == LOC_TRACE.DISABLED) return 0;
    if (mode <= LOC_TRACE_LEVEL) {
        show_debug_message($"[Localize] {msg}", value);
    }
    return 1;
}