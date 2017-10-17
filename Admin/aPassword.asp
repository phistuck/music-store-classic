<!--#include file="../Include/aInclude.asp" -->
<title>שינוי ססמת מנהל</title>
<%set c=server.createObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
c.Execute "update users set password='" & request.form("pw") & "' where username='" & request.form("un") & "'"
response.redirect "Admin.asp"%>
<!--#include file="../Include/aIncludedown.asp" -->