<!--#include file="../Include/aInclude.asp" -->
<title>����� �������</title>
<%Set c = Server.CreateObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
set r = c.execute("select*from Shop")
if not r.eof then%>
<basefont face=arial size=3> 
<H1><center>����� ������</center></h1>
<table border=1 bordercolor=blue align="center" cellspacing="0">
  <tr align="center"><th>��</th>
    <th>�����</th>
    <th>����</th>
    <th>������</th>
    <th>���� ����� �����</th>
    <th>���� ����� �����</th><th>�����/�����</th></tr>
<%do until r.eof
x=r("cd")%>
  <tr align="center">
    <td><%=r("name")%></td>
    <td dir=rtl><%=r("address")%></td>
    <%set q = c.execute ("select*from CDDatabase where cdno=" & x)%>
    <td><a href=CDPage.asp?cdno=<%=x%>><%=q("author")%> - <%=q("name")%></a></td>
    <%q.close
      set q = Nothing%>
    <td><%=r("copies")%></td>
    <td><%=r("ccex")%></td>
    <td><%=r("cc")%></td>
    <td><form action=delbuyer.asp method=get><input name=orderno type=hidden value="<%=r("orderno")%>"><input type=submit value='��� ����'></form></td></tr><%r.movenext
loop
r.close
set r = Nothing%></table><%else%>��� �����, �� ������� ������ �� �����.<%end if%><br>
<!--#include file="../Include/aIncludedown.asp" -->