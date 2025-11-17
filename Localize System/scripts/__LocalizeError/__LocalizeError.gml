
// feather ignore all
///@ignore
function __LocalizeError() {
    var _str = "";
    var _i = 0;
    repeat(argument_count) {
        _str += is_string(argument[_i]) ? argument[_i] : string(argument[_i]);
        ++_i;
    }
    show_error($"Localize v{__LOC_VERSION} - Error\n\n{_str}", true);
}
