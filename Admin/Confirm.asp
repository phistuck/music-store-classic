<%response.buffer=true%>
<title>אימות מנהל</title>
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
	גישתך למדור המנהלים נדחתה,
	עקב הקשת סיסמה או שם משתמש לא נכונים, אנא נסה שנית
	<a href=../alogin.asp>כאן</a>, או חזור לדף הבית
	<a href=../default.asp>כאן.</a>
<%end if
r.close
set r = Nothing%>