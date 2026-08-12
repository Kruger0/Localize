
var _font = LocalizeFontGet();
if (!is_string(_font)) {
    draw_set_font(_font);
}

var _langId     = LocalizeLangGetIndex();
var _langCount  = LocalizeLangGetCount();
var _langName   = LocalizeLangGetName();
var _langCode   = LocalizeLangGet();

var _arrowL = _langId ? "<< " : "   ";
var _arrowR = _langId == _langCount-1 ? "   " : " >>";

var _text = $"{_arrowL}{_langName} ({_langCode}){_arrowR}\n"+
Localize("text_intro")+"\n"+
Localize("text_debugger")+"\n"+
Localize("text_current_font", LocalizeFontGet())+"\n"+
Localize("msg_npc_greetings")+"\n"+
LocalizePlural("msg_score", points)+"\n"+
LocalizeOrdinal("msg_position", points);

draw_text_ext(32, 32, _text, 48, 1300);
draw_set_font(-1);
