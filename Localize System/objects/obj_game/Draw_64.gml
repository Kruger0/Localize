
if (keyboard_check_pressed(vk_enter)) {
	points++;
}

draw_set_font(global.font)

	draw_text(50, 50,  localize("text_intro"))
	draw_text(50, 100, localize("lang_check"))
	draw_text(50, 150, localize("key_placeholder"))
	draw_text(50, 200, localize("text_score", points))
	
draw_set_font(-1)