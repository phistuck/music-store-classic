<%response.buffer=true%>
<title>����� ����</title>
<!--#include file="../Include/Include.asp" -->
<%ok="no"
x=Request.Form("un")
y=Request.Form("pw")
Set c = Server.CreateObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
set r = c.execute("select * FROM users WHERE (username='"&x&"')")
do until ok="yes" or r.eof
if r("username")=x and r("password")=y then
session("ok")="yes"
response.redirect "admin.asp"
ok="yes"
else
r.movenext
end if
loop
if ok="no" then%>
	����� ����� ������� �����,
	��� ���� ����� �� �� ����� �� ������, ��� ��� ����
	<a href=../alogin.asp>���</a>, �� ���� ��� ����
	<a href=../default.asp>���.</a>
<%end if
r.close
set r = Nothing%>