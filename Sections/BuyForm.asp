<%response.buffer=true%>
<title>���� �����</title>
<!--#include file="../Include/Include.asp" -->
<%x=Request.QueryString("cdno")
Set c = Server.CreateObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
set r = c.execute("select*from CDDatabase")
r.Filter = "copies<>0"%><Script Language="JavaScript">
function numchk(str,usnam) //����� �����
{	form1.cctype.value=form1.ccpre.value 
//����� ������ ������ ����
	letok = "- ���������������������������"
	w=0
	for (q=0;q<usnam.length;q++)
		{ chna=usnam.charAt(q);
		for (r=0;r<letok.length;r++)
			if (chna==letok.charAt(r))
			w=w+1;			  }
	valid1=(w==usnam.length);
	if (valid1==false)
		return (valid1);
//����� ������ ����
	numok="0123456789"
	c=0;
	for (i=0;i<str.length;i++)
       { ch=str.charAt(i);
	for (j=0;j<numok.length;j++)
		if (ch==numok.charAt(j))
			c=c+1;		    }
	valid2=(c==str.length);
	if (valid2==false)
		return(false);
//����� ���� �����
	if (str.length!=12)
		return(false);
	if (usnam.length<5)
		return(false);
	if (form1.cctype.value=='')
		return(false);
	if (form1.ccmm.value=='')
		return(false);
	if (form1.ccyy.value=='')
		return(false);			}
</script>
<form name=form1 onSubmit="return(numchk(form1.ccno.value,form1.fullname.value))" action=Copies.asp Method=post>
	<table border=0><tr><th nowrap width="140">��� ����:</th><td><Input name=fullname></td></tr>
	<tr><th nowrap width="140">���� �. �����:</th></tr>
	<tr><%if x="" then%><th>���/� ����:</th><td><Select name=cdlist><Option selected></Option>
    <%while not r.eof%><Option value="<%=r("cdno")%>"><%=r("author")%> - <%=r("name")%></Option>
    <%r.MoveNext%><%WEND%></Select></td><%Else%><th>����� �����:</th><td><%=Request.QueryString("name")%>
    <input type=hidden name=cdlist value="<%=x%>"></td><%end if%>
	<tr><th nowrap width="140">���</th><td><Input name=cc type=radio OnClick="form1.ccpre.value=4580">����<br>
    <Input name=cc type=radio OnClick="form1.ccpre.value=4223">��������</td></tr>
	<tr><th nowrap width="140">����</th><td><Input name=ccno maxlength=12 size=12>
	<input disabled name=ccpre size=4><input type=hidden name=cctype></td></tr>
	<tr><th>����</th><td><Select name=ccmm><%for i=1 to 12 step 1%><Option value="<%=i%>"><%=i%></option><%next%>
	</select><Select name=ccyy><%for q=2002 to 2020 step 1%><Option value="<%=q%>"><%=q%></Option><%next%></select></td>
	<tr><th width="140" nowrap>�����:<br>(������: �������� 66<br>�� ����: 88989<br>��-���� 45654)</th><td>
	<TextArea name=address cols=24 rows=6></TextArea></td></tr></table>
	<Input type=submit value=���><Input type=reset value=���>
</form>