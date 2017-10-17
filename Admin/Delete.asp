<!--#include file="../Include/aInclude.asp" -->
<title>מחיקת משתמש</title>
<%x = request.querystring("cdno")
set c=server.createObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
c.Execute ("delete from CDDatabase where cdno=" & x)
response.redirect "cdsadmin.asp"%>
<!--#include file="../Include/aIncludedown.asp" -->
