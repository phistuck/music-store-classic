<%response.buffer=true%>
<title>�����</title>
<!--#include file="../Include/Include.asp" -->
<%session("qcd")=Request.Form("cdlist")
if session("qcd")="" then
response.redirect "BuyForm.asp"
else
function rep(strInput)
		strTemp=Replace(strInput,"'","`")
		rep=strTemp
end function
session("qname")=rep(Request.Form("fullname"))
session("qcc")=Request.Form("cctype") & Request.Form("ccno")
session("qccex")=Request.Form("ccyy") & "/" & Request.Form("ccmm")
session("qaddress")=rep(Request.Form("address"))%><title>��� ������</title>
<form action=buy.asp method=post>
��� ������ ������ �����?<br>
<select name=copies>
<%set c=server.createObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
set r = c.Execute ("select*from CDDatabase where cdno=" & session("qcd"))
for i=1 to r("copies")%>
<option value="<%=i%>"><%=i%></option>
<%next%>
</select>
<input type=submit value="��� ����"></form>
<%r.close
set r=Nothing
end if%>