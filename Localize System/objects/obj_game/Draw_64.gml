
draw_set_font(global.font);

var _langId     = LocalizeGetLangId();
var _langCount  = LocalizeGetLangCount();
var _langName   = LocalizeGetLangName();
var _langCode   = LocalizeGetLangCode();

var _text = $"{_langId ? "<<" : ""} {_langId} - {_langName} ({_langCode}) {_langId == _langCount-1 ? "" : ">>"}\n\n"+
Localize("text_intro")+"\n"+
Localize("text_debugger")+"\n"+
Localize("text_cycle")+"\n"+
Localize("lang_check")+"\n"+
Localize("text_placeholder")+"\n"+
Localize("text_score", points, Localize("text_key_space"));

draw_text_ext(32, 32, _text, 64, 1300);

draw_set_font(-1);
