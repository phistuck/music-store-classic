<!--#include file="../Include/aInclude.asp" -->
<title>����� ���� �����</title>
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
{	letok = "���������������������������- abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,.`'()@!#*&:\/1234567890"
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
function allchk(author,name,year,time,tracks,genre,copies,info)
{	if (author.value='')
	{	alert('��� �� ����� ���')
		return(false)}
	if (name.value=='')
	{	alert('��� �� ����� ���')
		return(false)}
	if (genre.value=='')
	{	alert("��� ��'��� ���")
		return(false)}
	if (insert.namestyle.value=='')
	{	alert('��� ������ �� ����')
		return(false)}
	if (year.value=='')
	{	alert('��� ��� ����� ���')
		return(false)}
	if (insert.enhanced.value=='')
	{	alert('��� �� ���� ������� ��������?')
		return(false)}
	if (time.length<=4)
	{	alert('��� ����� ���� �� ���')
		return(false)}
	if (tracks.value>=1||tracks.value<=22)
	{	alert('���� ������ ���� ����� ���� � - 0 ���� � - 23')
		return(false)}
	if (ltrchk(author)==false)
		return(false);		
	if (ltrchk(name)==false)
		return(false);			
	if (hltrchk(genre)==false)
		return(false);		
	if (numchk(year)==false)
		return(false);		
	if (numchk(time)==false)
		return(false);		
	if (numchk(tracks)==false)
		return(false);		
	if (infchk(info)==false)
		return(false);		
	if (numchk(copies)==false)
		return(false);		}
</script>
	<h1 align=center>����� ���� ����� ������</h1>
	<form name=insert method=post action=insert.asp 
	onSubmit="return(allchk(insert.author.value,insert.name.value,insert.year.value,insert.alllength.value,insert.t_no.value,insert.style.value,insert.copies.value,insert.info.value))">
	<table><tr><th>���:<br>(������)</th>
	<td valign=top><input name=author size=30></td></tr>
	<tr><th>�� ����:<br>(������)</th><td valign=top>
	<input name=name size=30></td></tr>
	<tr><th>��� ������:</th><td valign=top><select size=3 name=namestyle>
	<option value=rock>���</option><option value=metal>����</option>
	<option value=alternative>����������</option></select></td></tr>
	<tr>
      <th>��� ����:</th>
      <td valign=top><select size=2 name=type>
	<option value=album>�����</option><option value=single>�����</option></select></td></tr>
	<tr><th>���:<br>(������ 2001)</th><td valign=top>
	<input name=year maxlength=4 size=4></td></tr>
	<tr><th>��� ����� ����:<br>(������ 9.05)</th><td valign=top>
	<input name=alllength size=5 maxlength=5></td></tr>
	<tr><th>���� �����:</th><td valign=top>
	<input name=t_no maxlength=2 size=2></td></tr>
	<tr><th>�'���:<br>(�����)</th><td valign=top>
	<input name=style size=30></td></tr>
	<tr><th>����:<br>(����� ������� ���<br>����� �����)</th>
	<td valign=top><input name=info size=30 value=""></td></tr>
	<tr><th>���� ������� �����:</th><td valign=top>
	<select size=2 name=enhanced><option value=1>��</option>
	<option value=0>���</option></select></td></tr>
	<tr><th>������:</th><td valign=top><input name=copies size=4>
	</td></tr></table>
	<input type=submit value=����>
	</form>
<!--#include file="../Include/aIncludedown.asp" -->