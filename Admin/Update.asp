<!--#include file="../Include/aInclude.asp" -->
<title>עדכון מידע</title>
<%set c=server.createObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
c.Execute "update CDDatabase set " & request.form("updatechoice") & " = '" & request.form("record") & "' where cdno=" & request.form("cdno")
response.redirect "CDsAdmin.asp"%>
<!--#include file="../Include/aIncludedown.asp" -->