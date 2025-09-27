/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||                                --KrugDev    ||
  []=============================================[]


  --How to use!
  1. Create a Google Sheets file, share it and select "Anyone with the link" to be a Viewer (Reader).
     (You can also use the demo sheet as a base — just copy it and change the Sheet ID)
     
     Example demo sheet:
     https://docs.google.com/spreadsheets/d/19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444/edit?gid=0#gid=0
     Unique Sheet ID -->                   [19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444]
     
  2. Copy the unique sheet ID from the URL and paste it into the LOC_SHEET_ID macro.
  
  3. Call LocalizeHttp() in the Async HTTP event of your game manager object. A success message should appear in the console log.
  
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
  |language       | English           | Português         | Español                   |
  |---------------|-------------------|-------------------|---------------------------|
  |text_intro     | This is an intro!    | Isso é uma intro!    | Esta és una introducion!  |
  |---------------|-------------------|-------------------|---------------------------|
*/
