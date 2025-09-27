
///@ignore
function __LocTrace(mode, msg, value = undefined) {
    if (LOC_DEBUG_LEVEL == LOC_DEBUG.NONE) return 0;
    if (mode <= LOC_DEBUG_LEVEL) {
        show_debug_message($"[Localize] {msg}", value);
    }
    return 1;
}