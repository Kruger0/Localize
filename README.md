<h1 align="center">Localize 1.1</h1>
Localize is a localization system made for GameMaker, implemented with real time Google Sheets API synchronization and translation

## How to use!

1. Create a Google Sheets file, share it and select "Anyone with the link" to be a **Viewer** (Reader).
   (You can also use the [demo sheet](https://docs.google.com/spreadsheets/d/19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444/edit?gid=0#gid=0) as a base and just copy it and changing the ID)

   **.csv sheet format example**
   language   | English           | Português         | Español
   ---------- | ----------------- | ----------------- | -------
   text_intro | This is an intro! | Isso é uma intro! | Esta és una introducion!
   
2. Copy the unique sheet ID from the URL and paste on the **LOC_SHEET_ID** macro. 
   ```gml
   // Example
   // Full_sheet_url:  https://docs.google.com/spreadsheets/d/19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444/edit?gid=0#gid=0"
   // Unique Sheet ID:                                       |--------------------------------------------|

   #macro LOC_SHEET_ID "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444"	//The Google Sheet ID containing the localization.
   ```
3. Call the function ```localize_http()``` on the Async HTTP event on your game manager object.
   ```gml
   // Async HTTP Event
   localize_http()
   ```
4. Use the system by calling ```localize()``` as a string and the localized text will be returned.
   ```gml
   // Any Draw Event
   draw_text(x, y, localize("text_intro"))
   ```
Note that for the language change to appear in real time, the ```localize()``` function must be called in a repeatable event such as a **step**, **draw** or a **time source**.

The project contains further instructions on how to use it, along with a demo showing how to use the other ```localize_``` functions to get and set the language.
