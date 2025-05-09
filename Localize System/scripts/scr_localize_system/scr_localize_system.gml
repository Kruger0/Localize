
/*
	[]=========================================================[]
	||                    	Localization System for GMS2	   ||
	||                    									   ||
	||                    				          --KrugDev	   ||
	[]=========================================================[]


	How to use!
	1. Create a Google Sheets file, share it and select any person with the link to be a READER.
	   (You can also use the demo sheet as a base and just copy it and changing the ID)
	   https://docs.google.com/spreadsheets/d/19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444/edit?gid=0#gid=0
	2. Copy the unique sheet ID from the URL and paste on the script.
	3. Call the function localize_http() on the Async HTTP event on your game manager object.
	4. Check if the success message appears on the debug console.
	5. Use the system by calling localize([your text key]) as a string and the localized text will be returned.
	
	Important!
	By default, GameMaker is sandboxed so the .csv sheet will be downloaded at the AppData/Local path.
	Go in Game Options -> Windows and check Disable File System Sandbox
	Doing that, the .csv sheed will be downloaded directly to the included files of the game.
	At your game release, change the LOC_AUTOUPDATE to false if you want your game to be totally offline, otherwise it will try to update
	the .csv sheet at every start.
	
	Also important!
	In order for the system to work with CJK (Chinese Japanese Korean) languages, the font
	needs to be added to the game by the font_add() function. This demo has an example for that implementation.
	
	
.csv sheet format example
|---------------|-------------------|-------------------|---------------------------|
|language		| English			| Portugues			| Español 					|
|---------------|-------------------|-------------------|---------------------------|
|text_intro		| This is an intro!	| Isso é uma intro!	| Esta és una introducion!	|
|---------------|-------------------|-------------------|---------------------------|
*/


#macro LOC_SHEET_ID		"19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444"	// Your Google sheet id here

//=============================================================
#region Init variables

#macro LOC_FILENAME		"langs.data"									// Name of the .csv sheet after being downloaded
#macro LOC_LANG_KEY		"language"										// Key for the current language in the sheet
#macro LOC_LB_REPLACE	"[n]"											// Character to insert a line break
#macro LOC_AUTOUPDATE	true											// Update loc.csv file at startup. Set false if game is ready for release
#macro LOC_DEBUGGER		true											// Activates the Localize System debug view

///@ignore
function __loc_cache() {
	static data = {
		game_texts	: {},
		game_lang	: 0,
		loc_path	: GM_is_sandboxed ? working_directory : filename_dir(GM_project_filename)+"/datafiles/",
		loc_file	: undefined,
		loc_exists	: false,
		dbgv_ptr	: undefined,
		trace_msg	: {
			file_404	: "[Localize] - Localization file \"{0}\" not found.",
			key_404		: "[Localize] - Key \"{0}\" not found in ",
			lang_404	: "[Localize] - Language \"{0}\" not found in ",
			trns_404	: "[Localize] - Key \"{0}\" doesn't have a translation for {1}!",
			no_updt		: "[Localize] - Online file update failed!",
			updt_good	: "[Localize] - Cache successfully updated!",
			dl_good		: "[Localize] - Localization file successfully downloaded at: {0}.",
			dl_bad		: "[Localize] - Localization file download error: {0}",
			lang_index	: "[Localize] - Language index bigger than language count",
		}
	}
	return data;
}


#endregion
//=============================================================


//=============================================================
#region Functions

///@ignore
function __localize_init(_startup = false, _forced = true) {
	
	if ((LOC_AUTOUPDATE || _forced) && string_count(".",string(network_resolve("www.google.com")))) {
		//Credits to https://twitter.com/VINE2D for coming up with this
		var _link = "https://docs.google.com/spreadsheets/d/"+LOC_SHEET_ID+"/export?format=csv&id="+LOC_SHEET_ID+"&gid=0"
		var _path = __loc_cache().loc_path + LOC_FILENAME
		__loc_cache().loc_file = http_get_file(_link, _path)
	} else {
		show_debug_message(__loc_cache().trace_msg.no_updt)
	}
	
	// If a loc.csv already exists, use it untill the update happens
	if (_startup) {
		__localize_update()
	}
}

///@ignore
function __localize_update() {

	__loc_cache().game_texts = {};
	
	var _grid = load_csv(__loc_cache().loc_path + LOC_FILENAME);
	if (_grid == -1) {
		show_debug_message(string(__loc_cache().trace_msg.file_404, __loc_cache().loc_path + LOC_FILENAME))
		__loc_cache().loc_exists = false;
	} else {
		__loc_cache().loc_exists = true
	}
	
	if (__loc_cache().loc_exists) {
		var _w = ds_grid_width(_grid);
		var _h = ds_grid_height(_grid);

		for (var i = 0; i < _h; i++) {
		    var _texts = [];

		    for (var j = 1; j < _w; j++) {
		        _texts[j-1] = string_replace_all(_grid[# j, i], "[n]", "\n");
                
		    }
			var _key = _grid[# 0, i]
			if (_key == "") {
				_key = "missing_key"
			}
		    __loc_cache().game_texts[$ _key] = _texts;
		}
		ds_grid_destroy(_grid);
	}	
	
	localize_debug()
	show_debug_message(__loc_cache().trace_msg.updt_good)
}

///@func localize_http()
///@desc Trace the sheet file download status. Call it in Async HTTP on your game manager object.
function localize_http() {
	var _result
	if (ds_map_find_value(async_load, "id") == __loc_cache().loc_file) {
		var _status = ds_map_find_value(async_load, "status")
		var _load = async_load
		if (_status == 0) {
			_result = ds_map_find_value(async_load, "result");
			show_debug_message(__loc_cache().trace_msg.dl_good, _result)
			__localize_update()
	    } else if (_status < 0) {
			_result = ds_map_find_value(async_load, "http_status");
			show_debug_message(__loc_cache().trace_msg.dl_bad, _result)
		}
	}
}

///@func localize_debug()
///@desc Start/Update the debugger view for the system
function localize_debug() {
	
	if !(LOC_DEBUGGER) {
		return
	}
	
	if (dbg_view_exists(__loc_cache().dbgv_ptr)) {
		dbg_view_delete(__loc_cache().dbgv_ptr)
	}
	
	var _dbgref = ""
	var _langs = localize_get_langs()
	for (var i = 0, _len = array_length(_langs); i < _len; i++) {
		_dbgref += _langs[i]
		_dbgref+=$":{i}"+(i < _len-1 ? "," : "")
	}

	var _is_dbg_open = is_debug_overlay_open()
	__loc_cache().dbgv_ptr = dbg_view("Localize System", _is_dbg_open, 600, 270, 320, 250)
	dbg_section("Language")
	dbg_drop_down(ref_create(__loc_cache(), "game_lang"), _dbgref)
	dbg_section("File")
	dbg_text($"GM is sandboxed: {GM_is_sandboxed ? "true" : "false"}")
	dbg_text("File path: " + __loc_cache().loc_path)
	dbg_text("File name: " + LOC_FILENAME)
	dbg_button("Update loc.csv online", __localize_init, 300)
	dbg_button("Update loc.csv local", __localize_update, 300)
	show_debug_overlay(_is_dbg_open)
}

///@func localize_lang_count()
///@desc Returns the language count on the game.
function localize_lang_count() {
	return array_length(localize_get_langs());
}

///@func localize_get_langs()
///@desc Returns an array containing the languages actives in the game.
function localize_get_langs() {
	return __loc_cache().game_texts[$ LOC_LANG_KEY];
}

///@func localize_get_lang()
///@desc Returns the current game language in a string.
function localize_get_lang() {
	return localize(LOC_LANG_KEY);
}

///@func localize_set_lang(lang)
///@desc Set the game language from a real number on the language name in a string.
function localize_set_lang(_lang) {
	if (is_string(_lang)) {
		for (var i = 0; i < localize_lang_count(); i++) {
			if (_lang == __loc_cache().game_texts[$ LOC_LANG_KEY][i]) {
				__loc_cache().game_lang = i;
				return;
			}
		}
		show_error(string(__loc_cache().trace_msg.lang_404 + __loc_cache().loc_path + LOC_FILENAME, _lang), true);
	} else if (is_real(_lang)) {
		if (_lang+1 > localize_lang_count()) {
			show_error(__loc_cache().trace_msg.lang_index, true);
		}
		__loc_cache().game_lang = _lang;
	}
}

///@func localize(key, val0, val1...)
///@desc Returns the localized text on the lang cache from a provided key and the values to replace in the string.
function localize(_key) {
    var _arr = [];
	var _str = ""
	var _lng = __loc_cache().game_lang
	
    for (var i = 1; i < argument_count; i++) {
        _arr[i-1] = argument[i];
    }
	
    var _keymap = __loc_cache().game_texts[$ _key]
    if (is_array(_keymap)) {
        _str = string_ext(_keymap[_lng], _arr)
    } else {
        _str = string(__loc_cache().trace_msg.key_404 + __loc_cache().loc_path + LOC_FILENAME, _key);
    }
	
	if (_str == "") {
		_str = string(__loc_cache().trace_msg.trns_404, _key, localize(LOC_LANG_KEY))
	}
	
	return _str
}

///@func localize_ext(key, arg_array)
///@desc Returns the localized text on the lang cache from a provided key and an array with the values to replace in the string.
function localize_ext(_key, _array) {
    return string_ext(__loc_cache().game_texts[$ _key][__loc_cache().game_lang], _array);
}


#endregion
//=============================================================

__localize_init(true, false)
localize_debug()
