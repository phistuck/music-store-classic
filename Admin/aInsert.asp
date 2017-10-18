<!--#include file="../Include/aInclude.asp" -->
<title>הוספת המנהל</title>
<%function rep(strInput)
		strTemp=Replace(strInput,"'","`")
		rep=strTemp
end function
qun=Request.Form("un")
qpw=Request.Form("pw")
set c=server.createObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../../db/data.mdb")
set r = c.Execute ("select*from users where username = '"&qun&"'")
if not r.eof then%><script>alert('משתמש קיים');window.history.back()</script>
<%else
c.Execute "insert into users(username,password) values ('"&qun&"','"&qpw&"')"
response.redirect "admin.asp"
end if%>
<!--#include file="../Include/aIncludedown.asp" -->