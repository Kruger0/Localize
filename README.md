# Localize
Localization system for GMS2 multilingual support synchronized with Google Sheets!

## How to use!

	1. Create a Google Sheets file, share it and select any person with the link to be a READER.
	   (You can also use the demo sheet as a base and just copy it and changing the ID)
	   https://docs.google.com/spreadsheets/d/1D0lUpGg-U5eyMrBcpM9qFdkmoRtEl6VIpNawKUK8m5g/edit?gid=0#gid=0
	2. Copy the unique sheet ID from the URL and paste on the script.
	3. Call the function localize_http() on the Async HTTP event on your game manager object.
	4. Check if the success message appears on the debug console.
	5. Use the system by calling localize([your text key]) as a string and the localized text will be returned.
