
draw_set_font(fnt_game)

if (keyboard_check_pressed(vk_enter)) {
	points ++
}



draw_text(50, 50, localize("text_intro"))




draw_text(50, 100, localize("not_all_langs"))
draw_text(50, 150, localize("key_placeholder"))
draw_text(50, 200, localize("text_score", points))


draw_set_font(-1)