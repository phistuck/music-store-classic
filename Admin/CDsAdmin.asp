<!--#include file="../Include/aCDsInclude.asp" -->
<title>�����</title>
<body text=lightblue bgcolor=black>
<%sq="select*from CDDatabase"
Set c = Server.CreateObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
set r = c.execute(sq)%>
<title>����� �������</title>
	<H1><center>����� �������</center></h1><h2>rOCk</h2>
	<table border=1 bordercolor=#0000FF align="center" cellspacing="0">
	<tr align="center"><th>������</th><th>��� ����</th>
	<th>���� �����</th><th>����</th><th>�'���</th><th>���</th>
	<th>����/��</th><th>�� �����</th><th>������ �����</th></tr>
<%r.Filter = "namestyle = 'rock'"
  do until r.eof%>
	<tr align="center"><td><%=r("copies")%></td><td>
	<%=r("alllength")%></td><td><%=r("t_no")%></td>
	<td dir=rtl><%=r("info")%></td><td><%=r("style")%></td>
	<td><%=r("year")%></td><td><%=r("author")%></td>
	<td><a href=CDPage.asp?cdno=<%=r("cdno")%>><%=r("name")%></a></td>
	<td><form action=delete.asp method=get><br>
	<input name=cdno type=hidden value=<%=r("cdno")%>>
	<input type=submit value='��� �����'></form>
	<form action=modify.asp><input type=hidden name=cdno value=<%=r("cdno")%>>
	<input type=submit value="����/��� ������"></form></td></tr>
<%r.movenext
loop
r.movefirst%>
	</table><h2>metal</h2><table border=1 bordercolor=#0000FF
	align="center" cellspacing="0"><tr align="center">
	<th>������</th><th>��� ����</th><th>���� �����</th>
	<th>����</th><th>�'���</th><th>���</th><th>����/��</th>
	<th>�� �����</th><th>������ �����</th></tr>
<%r.Filter = "namestyle = 'metal'"
  do until r.eof%>
	<tr align="center"><td><%=r("copies")%></td><td>
	<%=r("alllength")%></td><td><%=r("t_no")%></td>
	<td dir=rtl><%=r("info")%></td><td><%=r("style")%></td>
	<td><%=r("year")%></td><td><%=r("author")%></td>
	<td><a href=CDPage.asp?cdno=<%=r("cdno")%>><%=r("name")%></a></td>
	<td><form action=delete.asp method=get><br>
	<input name=cdno type=hidden value=<%=r("cdno")%>>
	<input type=submit value='��� �����'></form>
	<form action=modify.asp><input type=hidden name=cdno value=<%=r("cdno")%>>
	<input type=submit value="����/��� ������"></form></td></tr>
<%r.movenext
loop
r.movefirst%>
	</table><h2>alternative</h2><table border=1 bordercolor=#0000FF
	align="center" cellspacing="0"><tr align="center">
	<th>������</th><th>��� ����</th><th>���� �����</th>
	<th>����</th><th>�'���</th><th>���</th><th>����/��</th>
	<th>�� �����</th><th>������ �����</th></tr>
<%r.Filter = "namestyle = 'alternative'"
  do until r.eof%>
	<tr align="center"><td><%=r("copies")%></td><td>
	<%=r("alllength")%></td><td><%=r("t_no")%></td>
	<td dir=rtl><%=r("info")%></td><td><%=r("style")%></td>
	<td><%=r("year")%></td><td><%=r("author")%></td>
	<td><a href=CDPage.asp?cdno=<%=r("cdno")%>><%=r("name")%></a></td>
	<td><form action=delete.asp method=get><br>
	<input name=cdno type=hidden value=<%=r("cdno")%>>
	<input type=submit value='��� �����'></form>
	<form action=modify.asp><input type=hidden name=cdno value=<%=r("cdno")%>>
	<input type=submit value="����/��� ������"></form></td></tr>
<%r.movenext
loop
r.close
set r = Nothing%>
	</table>
<!--#include file="../Include/aIncludedown.asp" -->