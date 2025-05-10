/*
	[]=============================================[]
	||        Localization System for GameMaker	   ||
	||         									   ||
	||         				          --KrugDev	   ||
	[]=============================================[]


	--How to use!
	1. Create a Google Sheets file, share it and select "Anyone with the link" to be a Viewer (Reader).
	   (You can also use the demo sheet as a base — just copy it and change the Sheet ID)
	   Example demo sheet:
	   https://docs.google.com/spreadsheets/d/19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444/edit?gid=0#gid=0
	   Unique Sheet ID -->                   |--------------------------------------------|
	2. Copy the unique sheet ID from the URL and paste it into the LOC_SHEET_ID macro.
	3. Call localize_http() in the Async HTTP event of your game manager object. A success message should appear in the console log.
	4. Use the system by calling localize("your_text_key") and it will return the localized string according to the setted language.
	
	--Important!
	By default, GameMaker runs in sandbox mode, so the .csv file will be downloaded to AppData/Local.
	To store it in the game directory instead, go to Game Options -> Windows, and check “Disable File System Sandbox”.
	This way, the .csv sheed will be downloaded directly to the included files of the game during development, and 
	automatically exported at the executable build.
	
	--Online mode
	If you want your game to autimatically checks for changes on the Google Sheets at every start, change the 
	LOC_ONLINE_MODE macro to "true". Otherwise it will only use the provided .csv file in the game included files
	
	--About CJK fonts
	In order for the system to work with CJK (Chinese Japanese Korean) languages, the font
	needs to be added to the game by the font_add() function. This demo has an example for that implementation.
	
	.csv sheet format example
	|---------------|-------------------|-------------------|---------------------------|
	|language		| English			| Português			| Español 					|
	|---------------|-------------------|-------------------|---------------------------|
	|text_intro		| This is an intro!	| Isso é uma intro!	| Esta és una introducion!	|
	|---------------|-------------------|-------------------|---------------------------|
*/

//=============================================================
#region Configuration

#macro LOC_SHEET_ID		"19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444"	// The Google Sheet ID containing the localization.
#macro LOC_FILENAME		"localize.dat"									// Name of the .csv sheet after being downloaded.
#macro LOC_LANG_KEY		"language"										// Key for the current language in the sheet.
#macro LOC_ONLINE_MODE	false											// If true, the final executable build will try to update the .csv at every start.
#macro LOC_AUTO_DETECT	true											// It true, the game will automatically checks for the system language and use it as default.
#macro LOC_TRACE		true											// Show debug trace messages on the console.
#macro LOC_ENCRYPT		true											// Encrypr the .csv sheet using a XOR key.
#macro LOC_MISSING_KEY	"loc_missing_key"								// The default key to use in a language when no key is provided

// If you want to use the LOC_AUTO_DETECT feature, place the languages used here
// along with their respective language code according to the ISO 639 Standart
languages = [
	["English",		"en"],
	["Español",		"es"],
	["Português",	"pt"],
	["Italiano",	"it"],
	["Русский",		"ru"],
	["简体中文",	"zh"],
	["日本語",		"ja"],
	["한국어",		"ko"],
	["Deutsch",		"de"],
	["Français",	"fr"],
]

// To use special characters like line breaks and other replacements, you can asign specific tags to 
// be replaced after parsing the .csv, as they can't be directly written in the sheet
tags = [
	["[n]", "\n"],
	["[r]", "\r"],
	["[uid]", environment_get_variable("USERNAME")]
]

#endregion
//=============================================================

//=============================================================
#region Functions

///@func localize_http()
///@desc Trace the sheet file download status. Call it in Async HTTP on your game manager object.
function localize_http() {
	var _result;
	var _async = json_parse(json_encode(async_load))
	if (_async[$ "id"] == __loc_cache().request_id) {
		var _http = _async[$ "http_status"];
		if (_http == 200) {
			var _path = _async[$ "result"];
			__loc_trace(__loc_cache().trace_msg.dl_good, _path);
			if (!GM_is_sandboxed && GM_build_type == "run") {
				// If its running from the IDE, the file will be automatically copyed to the included files
				var _path_src = __loc_cache().loc_path + LOC_FILENAME;
				var _path_dst = filename_dir(GM_project_filename)+"/datafiles/"+LOC_FILENAME;
				file_copy(_path_src, _path_dst);
				// TODO Encrypt
			}
			__localize_update()
	    } else {
			__loc_trace(__loc_cache().trace_msg.dl_bad, _async[$ "http_status"]);
		}
	}
}

///@func localize_get_lang_count()
///@desc Returns the language count on the game.
function localize_get_lang_count() {
	return array_length(localize_get_langs());
}

///@func localize_get_lang_name()
///@desc Returns the current game language as a string.
function localize_get_lang_name() {
	return localize(LOC_LANG_KEY);
}

///@func localize_get_lang_id()
///@desc Returns the current game language in an id.
function localize_get_lang_id() {
	return __loc_cache().game_lang
}

///@func localize_get_lang_code()
///@desc Returns the ISO 639 Code asigned to the curreng lang.
function localize_get_lang_code() {
	return __loc_cache().languages[localize_get_lang_id()][1]
}

///@func localize_get_langs()
///@desc Returns an array containing the languages actives in the game.
function localize_get_langs() {
	return __loc_cache().game_texts[$ LOC_LANG_KEY];
}

///@func localize_set_lang(lang)
///@desc Set the game language from the lang id or the lang name.
function localize_set_lang(_lang) {
	if (is_string(_lang)) {
		for (var i = 0; i < localize_get_lang_count(); i++) {
			if (_lang == __loc_cache().game_texts[$ LOC_LANG_KEY][i]) {
				__loc_cache().game_lang = i;
				return;
			}
		}
		__loc_trace(string(__loc_cache().trace_msg.lang_404 + __loc_cache().loc_path + LOC_FILENAME, _lang), true);
	} else if (is_real(_lang)) {
		if (_lang+1 > localize_get_lang_count()) {
			__loc_trace(__loc_cache().trace_msg.lang_index, true);
		}
		__loc_cache().game_lang = _lang;
	}
}

///@func localize_detect_lang()
///@desc Automatically detects the users system language and set it as the game language
function localize_detect_lang() {
	var _os_lang = os_get_language()
	for (var i = 0; i < array_length(__loc_cache().languages); i++) {
		var _lang = __loc_cache().languages[i]
		if (_os_lang == _lang[1]) {
			localize_set_lang(_lang[0])
			return;
		}
	}
	localize_set_lang(__loc_cache().languages[0][0]);
}

///@func localize(key, val0, val1...)
///@desc Returns the localized text on the lang cache from a provided key and the values to replace in the string.
function localize(_key) {
    var _arr = [];
	
	// Read all args
    for (var i = 1; i < argument_count; i++) {
        _arr[i-1] = argument[i];
    }
	
	return localize_ext(_key, _arr)
}

///@func localize_ext(key, arg_array)
///@desc Returns the localized text on the lang cache from a provided key and an array with the values to replace in the string.
function localize_ext(_key, _arr) {	
	var _str = "";
	var _lang = __loc_cache().game_lang;
	
	// Get localized string
    var _langs = __loc_cache().game_texts[$ _key];
    if (is_array(_langs)) {
        _str = string_ext(_langs[_lang], _arr);
    } else {
		// No key was found
        _str = string(__loc_cache().trace_msg.key_404, _key, LOC_FILENAME);
    }
	
	// No translation was found
	if (_str == "") {
		_str = string(__loc_cache().trace_msg.trns_404, _key, localize(LOC_LANG_KEY));
	}
	
	return _str;
}

#endregion
//=============================================================

//=============================================================
#region Internal

///@ignore
function __loc_cache() {
	static data = {
		game_texts	: {},
		game_lang	: 0,
		languages	: languages,
		tags		: tags,
		loc_path	: working_directory,
		request_id	: undefined,
		loc_exists	: false,
		dbgv_ptr	: undefined,
		trace_msg	: {
			file_404	: "Localization file \"{0}\" not found.",
			key_404		: "Key \"{0}\" not found in {1}",
			lang_404	: "Language \"{0}\" not found in {1}",
			trns_404	: "Key \"{0}\" doesn't have a translation for {1}!",
			offline		: "Offline mode. Using local file.",
			updt_good	: "Cache successfully updated!",
			dl_good		: "Localization file successfully downloaded at: {0}.",
			dl_bad		: "Error for downloading localization file: {0}",
			lang_index	: "Language index bigger than language count",
			sandboxed	: "File System Sandbox: {0}"
		}
	}
	return data;
}

///@ignore
function __loc_trace(_msg, _value = undefined) {
	if (LOC_TRACE) {
		show_debug_message($"[Localize] - {_msg}", _value);
	}
}

///@ignore
function __loc_encrypt(text, key) {
	var result = "";
	var key_length = string_length(key);
    
	// Convert the text to an array of bytes and apply XOR encryption
	for (var i = 1; i <= string_length(text); i++) {
		var char_code = ord(string_char_at(text, i));
		var key_char = ord(string_char_at(key, ((i - 1) % key_length) + 1));
        
		// XOR the character with the key
		// This works with all characters including special ones like \n (10), \r (13), \t (9)
		var encrypted_char = char_code ^ key_char;
        
		// Convert to hex representation to make it safer to store
		result += string_format(encrypted_char, 0, 0) + ":";
	}
    
	return result;
}

///@ignore
function __loc_decrypt(text, key) {
	var result = "";
	var key_length = string_length(key);
    
	// Split the encrypted text by colons to get individual byte values
	var bytes = string_split(text, ":");
	var num_bytes = array_length(bytes) - 1; // Subtract 1 because the last split will be empty
    
	for (var i = 0; i < num_bytes; i++) {
		var encrypted_value = real(bytes[i]);
		var key_char = ord(string_char_at(key, (i % key_length) + 1));
        
		// XOR again to decrypt
		var char_code = encrypted_value ^ key_char;
        
		result += chr(char_code);
	}    
	return result;
}

///@ignore
function __localize_init(_startup = false, _forced = true) {
	var _is_connected = string_count(".",string(network_resolve("www.google.com")));
	var _online_at_release = !(GM_build_type == "exe" && !LOC_ONLINE_MODE);
	
	if ((_online_at_release || _forced) && _is_connected) {
		// Online mode
		// Credits to https://twitter.com/VINE2D for coming up with this
		var _link = $"https://docs.google.com/spreadsheets/d/{LOC_SHEET_ID}/export?format=csv&id={LOC_SHEET_ID}&gid=0";
		var _path = __loc_cache().loc_path + LOC_FILENAME;
		__loc_cache().request_id = http_get_file(_link, _path);
	} else {
		// Offline mode
		__loc_trace(__loc_cache().trace_msg.offline);
		__localize_update();
		return;
	}
	
	// Try to load a .csv at the game start
	if (_startup) {
		__localize_update()
	}
}

///@ignore
function __localize_update() {

	__loc_cache().game_texts = {};
	// TODO Decrypt
	var _grid = load_csv(LOC_FILENAME);
	if (_grid == -1) {
		__loc_trace(string(__loc_cache().trace_msg.file_404, LOC_FILENAME));
		__loc_cache().loc_exists = false;
	} else {
		__loc_cache().loc_exists = true;
	}
	
	if (__loc_cache().loc_exists) {
		var _w = ds_grid_width(_grid);
		var _h = ds_grid_height(_grid);

		for (var i = 0; i < _h; i++) {
		    var _texts = [];
			var _tags = __loc_cache().tags;						
		    for (var j = 1; j < _w; j++) {
				var _text = _grid[# j, i]
				for (var k = 0; k < array_length(_tags); k++) {
					_text = string_replace_all(_text, _tags[k][0], _tags[k][1]);
				}				
		        _texts[j-1] = _text				
		    }
			var _key = _grid[# 0, i];
			if (_key == "") {
				_key = LOC_MISSING_KEY;
			}
		    __loc_cache().game_texts[$ _key] = _texts;
		}
		ds_grid_destroy(_grid);
		if (LOC_AUTO_DETECT) localize_detect_lang()
		__loc_trace(__loc_cache().trace_msg.updt_good);
	}	
	
	__loc_debug();
}

///@ignore
function __loc_debug() {
	
	if (dbg_view_exists(__loc_cache().dbgv_ptr)) {
		dbg_view_delete(__loc_cache().dbgv_ptr);
	}
	
	var _dbgref = "";
	var _langs = localize_get_langs();
	for (var i = 0, _len = array_length(_langs); i < _len; i++) {
		_dbgref += _langs[i];
		_dbgref+=$":{i}"+(i < _len-1 ? "," : "");
	}
	
	var _is_dbg_open = is_debug_overlay_open();
	__loc_cache().dbgv_ptr = dbg_view("Localize System", _is_dbg_open, 128, 128, 320, 250);
	dbg_section("Language");
	dbg_drop_down(ref_create(__loc_cache(), "game_lang"), _dbgref);
	dbg_section("File");
	dbg_text($"GM is sandboxed: {GM_is_sandboxed ? "true" : "false"}");
	dbg_text("File path: " + __loc_cache().loc_path);
	dbg_text("File name: " + LOC_FILENAME);
	dbg_button("Update loc.csv online", __localize_init, 300);
	dbg_button("Update loc.csv local", __localize_update, 300);
	show_debug_overlay(_is_dbg_open);
}

#endregion
//=============================================================

//=============================================================
#region System Init

__loc_trace(__loc_cache().trace_msg.sandboxed, $"{GM_is_sandboxed ? "Enabled" : "Disabled"}")
__localize_init(true, false)
__loc_debug()

#endregion
//=============================================================