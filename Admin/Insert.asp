<!--#include file="../Include/aInclude.asp" -->
<title>����� ����� ����� ����� ������ ��������</title>
<%function rep(strInput)
		strTemp=Replace(strInput,"'","`")
		rep=strTemp
end function
qname=rep(Request.Form("name"))
qauthor=rep(Request.Form("author"))
qenhanced=Request.Form("enhanced")
qnamestyle=rep(Request.Form("namestyle"))
qalllength=Request.Form("alllength")
qt_no=Request.Form("t_no")
qstyle=rep(Request.Form("style"))
qinfo=rep(Request.Form("info"))
qyear=Request.Form("year")
qcopies=Request.Form("copies")
qtype=Request.Form("type")
set c=server.createObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
c.Execute "insert into CDDatabase(name,author,enhanced,namestyle,style,t_no,alllength,info,year,copies,type) values ('"&qname&"','"&qauthor&"','"&qenhanced&"','"&qnamestyle&"','"&qstyle&"','"&qt_no&"','"&qalllength&"','"&qinfo&"','"&qyear&"','"&qcopies&"','"&qtype&"')"
set r = c.execute ("select*from CDDatabase where name = '" & qname & "' and author = '" & qauthor & "'")
session("cd")=r("cdno")%>
	<form action=upload.asp enctype=multipart/form-data method=post>
	����� ����� ����� (���� �����: 184 ������: 177):
	<input type=file size=40 name=file1><BR>
	����� �������� (���� �����: 219 ������: 212 ��� �����
	<a href=../images/CDTamplate.bmp target=_blank>��</a>): 
	<input type=file size=40 name=file2><BR>
	<input type=submit value="���� ������"></form>
<!--#include file="../Include/aIncludedown.asp" -->