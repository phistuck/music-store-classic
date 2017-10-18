<!--#include file="../Include/aInclude.asp" -->
<title>העלאת קבצי תמונות</title>
<%Set Upload = Server.CreateObject("Persits.Upload") 
Upload.OverwriteFiles = False 
Upload.Save 
NewName = Session("cd")
For Each File in Upload.Files 
   File.SaveAs "C:\Inetpub\WWWRoot\Images\Covers\" & NewName & ".jpg" 
   Response.Write "New name: " & File.FileName & "<BR>"
NewName = Session("cd") & "C"
Next
response.redirect "CDPage.asp?cdno=" & Session("cd")%>
<!--#include file="../Include/aIncludedown.asp" -->