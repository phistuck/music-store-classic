<%if session("ok")="yes" then
discno=Request.QueryString("cdno")
sq="select*from CDDatabase where cdno=" & discno
Set c = Server.CreateObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
set r = c.execute(sq)
title=r("name") & " - " & r("author")
y=r("t_no")
z=r("t1length")%>
<title><%=title%></title>
<body bgcolor=black topmargin="0">
<div align=right>
<basefont Face=Arial size=2>
	<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFCC">
    	<tr><td bgcolor="#6699FF" bordercolor="#6699FF"> 
        <p><center><font size="7"><i><font face="Times New Roman">
	<%=r("author")%></font></i></font><br></center></p>
        <p align=right><div dir=rtl><font size=+2>ג'אנר: <%=r("style")%>
	</font></div><br><br></td>
        <td bgcolor="#FFFFCC" bordercolor="#FFFFCC" width="284"><center>
	<img src=../Images/Covers/<%=discno%>.jpg border=0><br><b><i>
	<font face="Times New Roman" size="4"><%=r("name")%></font><br>
        </i></b><%=r("year")%></td></tr>
	<tr><td bgcolor="#6699FF" bordercolor="#6699FF"> 
<%x= "t" & r("t_no") & "length"%><p><b><ol>
<%if r(x)=0 then
for tracks=1 to y
if r("t"&tracks&"length")=0 then%>
        שיר מספר <%=tracks%>
	<form method=post action=trackins.asp>
        <input type=hidden name=cdno value="<%=discno%>">
        <input type=hidden name=trackno value=t<%=tracks%>>
        <input name=tname>
        <input name=tlength size=5>
        <input type=submit>
	</form>
<%tracks=y
end if
next
else
x=1
for x=1 to y step 1%>
	<li><%=r("t"&x)%> (<%=r("t"&x&"length")%>)</li>
<%next%></b></ol>
<%end if%></td>
	<td dir=rtl align=center bgcolor=#FFFFCC bordercolor=#FFFFCC width=284>
	<%=r("info")%></td></tr>
	<tr><td bgcolor=#6699FF bordercolor=#6699FF><div align=right dir=rtl>
	<b><i>זמן השמעה כולל: <%=r("alllength")%></i></b></div></td>
	<td></td></tr></table></div>
<%r.close
set r= Nothing%>
<!--#include file="../Include/aIncludedown.asp" -->