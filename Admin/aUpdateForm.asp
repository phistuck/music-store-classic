<!--#include file="../Include/aInclude.asp" -->
<title>����� ���� ����</title>
<Script>
function infchk(usnam) //����� ������, ����� �������
{	letok = "���������������������������- abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,.`'()@!#*&:\/1234567890"
	w=0
	for (q=0;q<usnam.length;q++)
		{ chna=usnam.charAt(q);
		for (r=0;r<letok.length;r++)
			if (chna==letok.charAt(r))
			w=w+1;			  }
	valid=(w==usnam.length);
	if (valid==false)
		return (valid); }
function allchk(un,pw)
{	if (un.value='')
	{	alert('��� �� ������ ���')
		return(false)}
	if (pw.value=='')
	{	alert('��� ����� ���')
		return(false)}
	if (infchk(un)==false)
		return(false);		
	if (infchk(pw)==false)
		return(false);		}
</script>
<h1 align=center>����� ���� ����</h1>
	<form name=ainsert method=post action=aPassword.asp 
	onSubmit="return(allchk(ainsert.un.value,ainsert.pw.value))">
	<table><tr><th>�� �����:</th><td valign=top><input name=un size=30></td></tr>
    <tr><th>����:</th><td valign=top><input type=password name=pw size=30></td></tr></table>
	<input type=submit value=����></form>
<!--#include file="../Include/aIncludedown.asp" -->