// feather ignore all
///@ignore
function __LocalizeDetectCellError(str) {
  if (str == "") return true;
  if (is_undefined(str)) return true;
  if (!LOC_DETECT_CELL_ERROR) return false;
  if (string_char_at(str, 1) != "#") return false;
  var _length = string_length(str);
  return (string_char_at(str, _length) == "!" || str == "#N/A");
}