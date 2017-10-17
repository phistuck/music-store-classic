<%discno=Request.QueryString("cdno")
sq="select*from CDDatabase where cdno=" & discno
Set c = Server.CreateObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
set r = c.execute(sq)
title=r("name") & " - " & r("author")%>
<title><%=title%></title>
<body bgcolor=black topmargin="0">
<Style>
A:link, A:visited, A:active { text-decoration: none; color: lightblue}
</Style>
<div align=right>
<basefont Face=Arial size=2>
  <table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor=black> 
        <a href="../../Sections/BuyForm.asp?name=<%=title%>&cdno=<%=discno%>"><img src=../Images/Covers/<%=discno%>C.jpg width=219 height=212 border=0></a></td>"%>
      <td bgcolor="#6699FF" bordercolor="#6699FF"> 
        <p align="center"><font size="7"><i><font face="Times New Roman"><%=r("author")%></font></i></font><br>
        </p>
      <p>
      <div align=right dir=rtl><font size="+2">ג'אנר: <%=r("style")%></font></div>
      <br><br>
    </td>
      <td bgcolor="#FFFFCC" bordercolor="#FFFFCC" width="284"> 
        <p align="center"> 
          <img src=../Images/Covers/<%=discno%>.jpg border=0>
          <br>
          <b><i><font face="Times New Roman" size="4"><%=r("name")%></font><br>
          </i></b><%=r("year")%></p>
        </td>
  </tr>
  <tr> 
	  <td bgcolor=black></td>
      <td bgcolor="#6699FF" bordercolor="#6699FF">
        <p>
<b><ol><%y=r("t_no")
x=1
for x=1 to y step 1%><li><%=r("t"&x)%> (<%=r("t"&x&"length")%>)<%next%></b></ol></td>
      <td dir=rtl align=center bgcolor="#FFFFCC" bordercolor="#FFFFCC" width="284"><%=r("info")%></td>
  </tr>
  <tr>
	  <td bgcolor=black></td>
      <td bgcolor="#6699FF" bordercolor="#6699FF"> 
        <div align=right dir=rtl><b><i>זמן השמעה כולל: <%=r("alllength")%></i></b></div>
    </td><td></td>
  </tr>
</table></div>
<%r.close
set r= Nothing%>