<h1 align="center">Localize 1.0</h1>
Localize is a translation/localization system made for GameMaker Studio 2, implemented with real time Google Sheets API syncronization

## How to use!

1. Create a Google Sheets file, share it and select any person with the link to be a **READER**.
   (You can also use the [demo sheet](https://docs.google.com/spreadsheets/d/19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444/edit?gid=0#gid=0) as a base and just copy it and changing the ID)
2. Copy the unique sheet ID from the URL and paste on the script. 
   ```gml
   // Example
   "https://docs.google.com/spreadsheets/d/19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444/edit?gid=0#gid=0"
                      Unique Sheet ID --> "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444"
   ```
3. Call the function ```localize_http()``` on the Async HTTP event on your game manager object.
   ```gml
   // Async HTTP Event
   localize_http()
   ```
4. Use the system by calling ```localize()``` as a string and the localized text will be returned.
   ```gml
   draw_text(x, y, localize("your_text_key"))
   ```

Note that for the language change to appear in real time, the ```localize()``` function must be called in a repeatable event such as a **step**, **draw** or a **time source**
