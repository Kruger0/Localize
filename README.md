[![GitHub license](https://img.shields.io/github/license/Kruger0/Localize)](https://github.com/Kruger0/Localize/blob/main/LICENSE)
[![GitHub release](https://img.shields.io/github/v/release/Kruger0/Localize)](https://github.com/Kruger0/Localize/releases)
[![GameMaker](https://img.shields.io/badge/GameMaker-2023.14+-blue?logo=gamemaker)](https://gamemaker.io/)
[![GitHub last commit](https://img.shields.io/github/last-commit/Kruger0/Localize)](https://github.com/Kruger0/Localize/commits)
<div align="center">
   <h1>Localize 2.0.0</h1>
</div>
Localize is a comprehensive localization system made for GameMaker, implemented with CSV parsing, Google Sheets synchronization, automatic font resolution, and advanced string formatting support

## How to use!

1. Create a Google Sheets file, share it and select "Anyone with the link" to be a **Viewer** (Reader).
   You can use the [demo sheet](https://docs.google.com/spreadsheets/d/19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444/edit?gid=0#gid=0) as a base. Just copy it to a new blank spreadsheet)

   **Sheet format example:**
   Language Keys | en-US | pt-BR | es-ES
   -| - | - | -
   LOC_LANGNAME | English | Portugês | Español
   LOC_FONTNAME |  | fntLatin | fntLatin
   LOC_PRODUCTION | Enabled | Enabled | Disabled
   text_intro | This is an intro! | Isso é uma intro! | Esta és una introducion!
   
2. Copy the unique sheet ID from the URL (and optinally the page ID) and use it on the `LocalizeLoad()` function. 
   ```js
   // File Loading Example
   // Full Sheet URL:  https://docs.google.com/spreadsheets/d/19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444/edit?gid=0#gid=1628623745"
   //                                                Sheet ID|--------------------------------------------|       Page Id|----------|
   LocalizeLoad("localize.loc", "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1628623745");
   ```
3. Define a language to be used from your localization file. Either using `LocalizeFallbackSet()` or `LocalizeLangSet()`. If you want to get the current language of the user system, the function `LocalizeLangDetect()` can also be used
   ```js
   // Setup Example
   LocalizeFallbackSet("en-US");

   // Read the global.lang from a save or configuration file
   if (global.lang == undefined) {
      global.lang = LocalizeOSLocaleGet(); // "en-US", "pt-BR"...
   }
   
   LocalizeLangSet(global.lang);

   ```
4. Use the system by calling ```Localize()``` as a string and the localized text will be returned.
   ```js
   // Any Draw or Step Event
   draw_text(x, y, Localize("text_intro"));
   ```
Note that for the language change to appear in real time, the ```Localize()``` function must be called in a repeatable event such as a **step**, **draw** or a **time source**.

## System Features

### String Formatting
The system supports advanced string parsing features directly in your translation files:
```js
// Arguments: "You have {0} gold and {1} items."
Localize("msg_stats", 500, 2); // "You have 500 gold and 2 items"

// Recursion: "Have you talked to the {key:npc_name_01}?."
// Automatically fetches the string for 'npc_name_01'
Localize("dialog_npc_01"); // "Have you talked to the Old Blacksmith?"

// Tags: "Hello, {tag:username}! Where are you from?"
// Resolves to custom tags defined in your game
LocalizeTagSet("username", global.username);
Localize("msg_user_greetings");
```

### Automatic Font Resolution
Fonts are handled automatically via the **LOC_FONTNAME** row in your sheet file, on at runtime using `LocalizeFontSet()`, and will be solved either as an IDE font asset; an external file font; or just as a string, allowing custom font systems compatibility like Scribble
```js
var _font = LocalizeFontGet();
if (!is_string(_font)) {
   draw_set_font(_font);
} else {
   // Use _font as a scribble font reference...
}
```
Note: if no font is defined neither in the sheet, neither using `LocalizeFontSet()`, the system will use its [internal fallback font](https://github.com/anthonyfok/fonts-wqy-microhei) (WenQuanYi Micro Hei).

## Complete API Reference

### Core
- `Localize(key, [args...])` - Get a translated string with optional arguments
- `LocalizePlural(key, count)` - Get a translated string with a sulfix for plural handling (e.g. "1 Coin" vs "5 Coins")
- `LocalizeOrdinal(key, value)` - Get a translated string with a sulfix for ordinal handling (e.g. "1st", "2nd", "3º"...)
- `LocalizeLoad(path, [sheetId], [sheetPage])` - Initialize the system with a local config file and optional Google Sheet ID + Page ID
- `LocalizeFlush()` - Free all localization data from memory

### Language
- `LocalizeLangSet(language)` - Set the active language (e.g. "en-US") and trigger async loading
- `LocalizeLangGet()` - Get the ISO code of the currently active language
- `LocalizeLangGetName()` - Get the display name of the currently active language
- `LocalizeLangGetCount()` - Get the total number of languages available
- `LocalizeLangSetIndex(index)` - Set the active language using its numeric index
- `LocalizeLangGetIndex()` - Get the numeric index of the currently active language
- `LocalizeLangGetCodes()` - Get an array of all loaded ISO language codes
- `LocalizeLangGetNames()` - Get an array of all loaded display names
- `LocalizeLangExists(language)` - Check if a language code is defined
- `LocalizeLangDetect()` - Run automatic language detection based on OS locale
- `LocalizeOSLocaleGet()` - Get the operating system's language code

### Fonts
- `LocalizeFontGet()` - Get the current active font resource ID
- `LocalizeFontGetName()` - Get the asset name of the current font (e.g. "fnt_Arial")
- `LocalizeFontGetFamily()` - Get the font family name (e.g. Arial)
- `LocalizeFontSet(language, font)` - Manually override the current font
- `LocalizeFontSetDefault(font)` - Set the fallback font
- `LocalizeFontGetDefault()` - Get the current fallback font ID

### Fallback
- `LocalizeFallbackSet(language)` - Set the fallback language code
- `LocalizeFallbackGet()` - Get the current fallback language code

### Tags
- `LocalizeTagSet(key, value)` - Define a global custom tag (e.g. `{tag:user}` -> `Player Name`)
- `LocalizeTagGet(key)` - Retrieve a custom tag value
