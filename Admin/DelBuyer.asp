<!--#include file="../Include/aInclude.asp" -->
<title>πιδεμ</title>
<%x = request.querystring("orderno")
set c=server.createObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
c.Execute ("delete from Shop where orderno=" & x)
response.redirect "Shoplist.asp"%>
<!--#include file="../Include/aIncludedown.asp" -->

