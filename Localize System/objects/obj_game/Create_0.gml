
window_set_size(960, 540);
window_center();
gpu_set_tex_filter(true);

points = 0;
var _font = "NotoSansCJK-Regular.ttc";
global.font = font_add(_font, 36, false, false, 32, 255);

LocalizeDownloadSheet("langs/baseGame.dat",     "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "0");
LocalizeDownloadSheet("langs/dialogues.dat",    "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1449269156");
LocalizeDownloadSheet("langs/missions.dat",     "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1212707375");

LocalizeSetFallback("English");
LocalizeDetectLang();

LocalizeSetTag("[user_id]", environment_get_variable("USERNAME"));
LocalizeSetTag("[os_date]", $"{current_year}-{current_month}-{current_day}");