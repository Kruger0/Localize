/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeDetectCellError(str) {
  if (!LOC_DETECT_CELL_ERROR) return false;
  if (is_undefined(str)) return true;
  if (string_char_at(str, 1) != "#") return false;
  var _length = string_length(str);
  return (string_char_at(str, _length) == "!" || str == "#N/A");
}