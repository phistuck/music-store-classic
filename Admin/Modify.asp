<!--#include file="../Include/aInclude.asp" -->
<title>�����/����� ���� ����</title>
<Script>
function ltrchk(usnam) //����� ������, ����� ������� �������
{	letok = "- abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,.`'()@!#*&:\/1234567890"
	w=0
	for (q=0;q<usnam.length;q++)
		{ chna=usnam.charAt(q);
		for (r=0;r<letok.length;r++)
			if (chna==letok.charAt(r))
			w=w+1;			  }
	valid1=(w==usnam.length);
	if (valid1==false)
		return (valid1); }
function infchk(usnam) //����� ������, ����� �������
{	letok = "- abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,.`'()@!#*&:\/���������������������������1234567890"
	w=0
	for (q=0;q<usnam.length;q++)
		{ chna=usnam.charAt(q);
		for (r=0;r<letok.length;r++)
			if (chna==letok.charAt(r))
			w=w+1;			  }
	valid1=(w==usnam.length);
	if (valid1==false)
		return (valid1); }
function hltrchk(usnam) //����� ������, ����� ������� ������
{	letok = "- ���������������������������,.`'\/1234567890"
	w=0
	for (q=0;q<usnam.length;q++)
		{ chna=usnam.charAt(q);
		for (r=0;r<letok.length;r++)
			if (chna==letok.charAt(r))
			w=w+1;			  }
	valid1=(w==usnam.length);
	if (valid1==false)
		return (valid1); }
function numchk(str) //����� ����� ����
{	numok="0123456789."
	c=0;
	for (i=0;i<str.length;i++)
       { ch=str.charAt(i);
	for (j=0;j<numok.length;j++)
		if (ch==numok.charAt(j))
			c=c+1;		    }
	valid2=(c==str.length);
	if (valid2==false)
		return(false); }
function allchk(choice,record)
{	if (record.value=="")
	{	alert('��� ���� ������ ���!! ��� ������ ���� ����� �� ��� ��???')
		return(false)}
	if (choice=='name')
	{	if (chk(record)==false)
		{	alert('���� ������ ����� ���� ���� ��� ��')
			return(false)}}
	if (choice=='author')
	{	if (chk(record)==false)
		{	alert('���� ������ ����� ���� ���� ��� ��')
			return(false)}}
	if (choice=='')
	{	if (chk(record)==false)
		{	alert('���� ������ ����� ���� ���� ��� ��')
			return(false)}}
	if (choice=='')
	{	if (chk(record)==false)
		{	alert('���� ������ ����� ���� ���� ��� ��')
			return(false)}}
	if (choice=='t_no')
	{	if (tracks.value>=1||tracks.value<=22)
		{	alert('���� ������ ���� ����� ���� � - 0 ���� � - 23')
			return(false)}
		if (numchk(record)==false)
		{	alert('���� ���� �� ����')
			return(false)}}}
function songchk(name,length)
{	if (ltrchk(name)==false)
	{	alert('�� ���� ���� ����')
		return(false)}
	if (numchk(length)==false)
	{	alert('�� ���� ���� ����')
		return(false)} }
</Script>
	<form name=modify method=post action=update.asp 
	onSubmit="return(allchk(modify.updatechoice.value,modify.record.value))">
	<input name=cdno type=hidden value=<%=request.querystring("cdno")%>>
	�� ������ �����?<br><select name=updatechoice>
	<option value=name>�� �����</option>
	<option value=author>�� �����</option>
	<option value=t_no>���� ������</option>
	<option value=info>���� �� �����</option>
	<option value=alllength>��� ����</option>
	<option value=year>���</option>
	<option value=enhanced>���� �������</option>
	<option value=style>�'���</option>
	<option value=namestyle>��� ������</option>
	<option value=copies>���� ������</option></select>
	<br><input name=record><input type=submit value=����></form>
<%set c=server.createObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
r = c.execute ("select*from CDDatabase where cdno=" & request.querystring("cdno"))%>
	������ ���� ����� �����: (������ ����� ���� ����� �����)
	<form method=post action=trackins.asp onsubmit="return(songchk(smodify.tname.value,smodify.tlength.value))">
	��� ���� ���: <select name=trackno><%for tracks=1 to r("t_no")%><option value=t<%=tracks%>>��� ���� <%=tracks%></option>
<%next%>
	</select><br>�� ����: <input name=tname><br>��� ����:<input name=tlength size=5><br>
	<input type=submit value="��� ���� �� ����"><input type=hidden name=cdno value="<%=request.querystring("cdno")%>">
	</form>
<!--#include file="../Include/aIncludedown.asp" -->