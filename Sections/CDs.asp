<%response.buffer=true%>
<title>ניהול</title>
<body text=lightblue bgcolor=black>
<!--#include file="../Include/CDsInclude.asp" -->
<%sq="select*from CDDatabase"
Set c = Server.CreateObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../../db/data.mdb")
set r = c.execute(sq)%>
<title>רשימת הדיסקים</title>
<H1><center>רשימת הדיסקים</center></h1><%r.Filter = "namestyle = 'rock' and copies <> 0"
if not r.eof then%>
<h2>rOCk</h2>
<table border=1 bordercolor=blue align=center cellspacing=0 width=600>
  <tr align="center"><th>מידע</th><th>ג'אנר</th><th>שנה</th><th>מבצע/ים</th><th>שם הדיסק</th></tr><%do until r.eof%>
	<tr align="center"><td dir=rtl><%=r("info")%></td><td><%=r("style")%></td><td><%=r("year")%></td><td><%=r("author")%></td>
    <td><a href="CDPage.asp?cdno=<%=r("cdno")%>"><%=r("name")%></a></td></tr><%r.movenext
loop
r.movefirst
end if
r.Filter = "namestyle = 'metal' and copies <> 0"
if not r.eof then%></table><h2>mETaL</h2>
<table border=1 bordercolor=blue align=center cellspacing=0 width=600>
  <tr align="center"><th>מידע</th><th>ג'אנר</th><th>שנה</th><th>מבצע/ים</th><th>שם הדיסק</th></tr>
<%do until r.eof%><tr align="center"><td dir=rtl><%=r("info")%></td><td><%=r("style")%></td><td><%=r("year")%></td><td><%=r("author")%></td>
    <td><a href="CDPage.asp?cdno=<%=r("cdno")%>"><%=r("name")%></a></td></tr><%r.movenext
loop
r.movefirst
end if
r.Filter = "namestyle = 'alternative' and copies <> 0"
if not r.eof then%></table><h2>aLTeRNaTIvE</h2>
<table border=1 bordercolor=blue align=center cellspacing=0 width=600>
  <tr align="center"><th>מידע</th><th>ג'אנר</th><th>שנה</th><th>מבצע/ים</th><th>שם הדיסק</th></tr><%do until r.eof%>
	<tr align="center"><td dir=rtl><%=r("info")%></td><td><%=r("style")%></td><td><%=r("year")%></td><td><%=r("author")%></td>
    <td><a href="CDPage.asp?cdno=<%=r("cdno")%>"><%=r("name")%></a></td></tr><%r.movenext
loop
end if
r.close
set r = Nothing%></table>