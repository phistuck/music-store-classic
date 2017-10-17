<!--#include file="../Include/aInclude.asp" -->
<title>הוספת שמות שירים</title>
<%set c=server.createObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
c.Execute "update CDDatabase set " & request.form("trackno") & " = '" & request.form("tname") & "' where cdno=" & request.form("cdno")
c.Execute "update CDDatabase set " & request.form("trackno") & "length = '" & request.form("tlength") & "' where cdno=" & request.form("cdno")
response.redirect "CDPage.asp?cdno=" & Request.Form("cdno")%>
<!--#include file="../Include/aIncludedown.asp" -->