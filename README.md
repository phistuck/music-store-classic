# music-store-classic
The first website, client and server, I have ever built (a 2002 high school project).

Nostalgia.

## Warnings
- This code is very old (2002), Internet Explorer specific, not meant to be secure. It is a wonder it even works in any way.
- It is known to be prone to SQL injections, cross site scripting and anything else you have in mind. Do not use this in production without heavily modifying it (actually, just begin from scratch).
- It is extremely ugly, in terms of visuals, code, methodology and technology. Vanilla JavaScript, though, but not much of it (and minimal CSS).
- It uses quirks mode (barfing, I know) and `alert`s.
- It is mostly in Hebrew.

## System Requirements
### Server
Windows XP Professional 32-bit with IIS 5.1. Or later versions of Windows and IIS or IIS Express (see Server Workarounds below).

### Client
Internet Explorer 5 and later.

## Server Prerequisites
- Regional settings must be set to Israel or Hebrew or something.
  
  The encoding is not explicitly specified and it is not UTF-8, but Windows 1255.
  
  (Not required when using the server workarounds below)
- For compact disc images and cover images upload functionality, download and install AspUpload 32 bit from -

  https://drive.google.com/open?id=0Bxwga4EKqxwPZnYyV1RQcVlta2c
  
  Or, using the Server Workarounds below, find a suitable version from (not guaranteed to work) -

  www.aspupload.com

## Running The Server
1. Put the files under `c:\inetpub\wwwroot` and go to http://localhost/ (or whatever port you have set).
2. Move `Data.mdb` to `c:\inetpub\db`.

## Administrator credentials
User name - `admin`
Password - `1234`

## Client Prerequisites
- Regional settings must be set to Israel or Hebrew or something.
  
  The encoding is not explicitly specified and it is not UTF-8, but Windows 1255.
  
  (Not required when using the server workarounds below)

## Sample Data
You can download the sample data package which includes a database with some usernames and a small selection of compact discs, including their images and cover images from my Google Drive -

https://drive.google.com/open?id=0Bxwga4EKqxwPVkw1cFpJVlFyVms

## Server Workarounds
Windows XP and IIS 5.1 are not really required to run the server and your original regional settings can remain unchanged. I tried Windows 10 and Visual Studio 2017 (using a free [two-hour-virtual-lab](https://vlabs.holsystems.com/vlabs/technet?eng=VLabs&auth=none&src=vlabs&altadd=true&labid=32158&lod=true)) with its IIS Express and it works (I did not get AspUpload to work, but I did not really make an effort) by following these steps -
1. Clone/download and extract the project to somewhere locally (named "the project folder" from here on). Move Data.mdb to one folder above the folder and into a `db`. In other words, to `(project-folder)\..\db\`.
2. Launch Visual Studio 2017.
3. File menu > Open > Website.
4. Select the project folder.
5. Click on OK.
6. Debug menu > Start Without Debugging.
7. File > Close Solution.
8. Click on Yes to save it.
9. Save the solution in the project folder.
10. Open the solution again.
11. Debug menu > Start Without Debugging.
12. Go to the newly generated `.vs` folder in the project folder.
13. Go to the `config` folder.
14. Open `applicationhost.config` with a text editor (or Visual Studio, whatever).
15. Under `<system.webServer>` (the second one in the file, because the first one is commented out), remove the `<asp`...`</asp>` element and replace it with the following -
```
<rewrite>
 <outboundRules>
  <rule name="Add Charset" enabled="true">
   <match serverVariable="RESPONSE_Content_Type" pattern="text/html" />
   <action type="Rewrite" value="text/html; charset=utf-8" />
  </rule>
 </outboundRules>
</rewrite>
<asp>
<asp codePage="65001" scriptErrorSentToBrowser="true" enableParentPaths="true" bufferingOn="true" errorsToNTLog="true" appAllowDebugging="true" appAllowClientDebug="true">
    <cache diskTemplateCacheDirectory="%TEMP%\iisexpress\ASP Compiled Templates" />
    <session allowSessionState="true" />
    <limits />
</asp>
```
16. Also under `<system.webServer>`, add under `<httpProtocol>`, under `<customHeaders>` -
```
<add name="X-UA-Compatible" value="IE=5"/>
```
17. Go to the served application using Internet Explorer 5 and later.

## License
MIT. Enjoy.
