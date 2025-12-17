
//draw_circle(300, 300, dsin(current_time/200)*128, false);

var _font = LocalizeFontGet()
draw_set_font(_font);

var _langId     = LocalizeLangGetIndex();
var _langCount  = LocalizeLangGetCount();
var _langName   = LocalizeLangGetName();
var _langCode   = LocalizeLangGet();

var _arrowL = _langId ? "<< " : "   ";
var _arrowR = _langId == _langCount-1 ? "   " : " >>";

var _text = $"{_arrowL}{_langName} ({_langCode}){_arrowR}\n"+
Localize("text_intro")+"\n"+
Localize("text_debugger")+"\n"+
Localize("lang_check")+"\n"+
string(_font)+"\n"+
LocalizePlural("msg_score", points)+"\n"+
LocalizeOrdinal("msg_position", points);

draw_text_ext(32, 32, _text, 48, 1300);

draw_set_font(-1);