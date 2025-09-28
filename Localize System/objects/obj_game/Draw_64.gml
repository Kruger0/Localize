
draw_set_font(global.font)
    
var _text = $"{LocalizeGetLangId()==0?"":"<<"} {LocalizeGetLangId()} - {LocalizeGetLangName()} ({LocalizeGetLangCode()}) {LocalizeGetLangId()==LocalizeGetLangCount()-1?"":">>"}\n"+
LocalizeText("text_intro")+"\n"+
LocalizeText("text_debugger")+"\n"+
LocalizeText("text_cycle")+"\n"+
LocalizeText("lang_check")+"\n"+
LocalizeText("key_placeholder")+"\n"+
LocalizeTextExt("text_score", [points])

draw_text_ext(48, 48, _text, 64, 1300)

draw_set_font(-1)
