
draw_set_font(global.font)
	
var _text = $"{localize_get_lang_id()==0?"":"<<"} {localize_get_lang_id()} - {localize_get_lang_name()}({localize_get_lang_code()}) {localize_get_lang_id()==localize_get_lang_count()-1?"":">>"}\n"+
localize("text_intro")+"\n"+
localize("text_debugger")+"\n"+
localize("text_cycle")+"\n"+
localize("lang_check")+"\n"+
localize("key_placeholder")+"\n"+
localize_ext("text_score", [points])

draw_text_ext(48, 48, _text, 64, 1300)

draw_set_font(-1)
