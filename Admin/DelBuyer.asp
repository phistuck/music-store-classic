<!--#include file="../Include/aInclude.asp" -->
<title>ניהול</title>
<%x = request.querystring("orderno")
set c=server.createObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../../db/data.mdb")
c.Execute ("delete from Shop where orderno=" & x)
response.redirect "Shoplist.asp"%>
<!--#include file="../Include/aIncludedown.asp" -->

