
draw_set_font(global.font);

var _langId     = LocalizeGetLangId();
var _langCount  = LocalizeGetLangCount();
var _langName   = LocalizeGetLangName();
var _langCode   = LocalizeGetLangCode();

var _text = $"{_langId ? "<<" : ""} {_langId} - {_langName} ({_langCode}) {_langId == _langCount-1 ? "" : ">>"}\n\n"+
LocalizeText("text_intro")+"\n"+
LocalizeText("text_debugger")+"\n"+
LocalizeText("text_cycle")+"\n"+
LocalizeText("lang_check")+"\n"+
LocalizeText("text_placeholder")+"\n"+
LocalizeTextExt("text_score", [points]);

draw_text_ext(32, 32, _text, 64, 1300);

draw_set_font(-1);
