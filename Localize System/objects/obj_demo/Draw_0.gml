
//draw_circle(300, 300, dsin(current_time/200)*128, false);


var _font = LocalizeFontGet()
draw_set_font(_font);

var _langId     = LocalizeLangGetIndex();
var _langCount  = LocalizeLangGetCount();
var _langName   = LocalizeLangGetName();
var _langCode   = LocalizeLangGet();

var _arrowL = _langId ? "<< " : "";
var _arrowR = _langId == _langCount-1 ? "" : " >>";

var _text = $"{_arrowL}{_langName} ({_langCode}){_arrowR}\n"+
Localize("text_intro")+"\n"+
Localize("text_debugger")+"\n"+
Localize("text with - a weird k3y")+"\n"+
Localize("lang_check")+"\n"+
Localize("text_placeholder")+"\n"+
Localize("dialog.warrior.2")+"\n"+
Localize("item.ironSword.name")+"\n"+
string(_font)+"\n"+
Localize("text_score", points, Localize("text_key_space"));

draw_text_ext(32, 32, _text, 48, 1300);

//draw_text_ext(32, 32, Localize("regador_desc"), 48, 1300)

draw_set_font(-1);

draw_text(16, 16, $"{fps_real} | {fps}")