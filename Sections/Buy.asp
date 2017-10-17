<%response.buffer=true%>
<title>ניהול</title>
<!--#include file="../Include/Include.asp" -->
<%function rep(strInput)
		strTemp=Replace(strInput,"'","`")
		rep=strTemp
end function
qname=session("qname")
qcd=session("qcd")
qcc=session("qcc")
qccex=session("qccex")
qaddress=session("qaddress")
qcopies=Request.Form("copies")
set c=server.createObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../data.mdb")
set r = c.execute ("select*from CDDatabase where cdno=" & qcd)
if r("copies") =< qcopies - 1 then%>
ההזמנה בוטלה, כנראה הזמנת יותר מידי עותקים וחשבת לאט או שהם נגמרו. אם ברצונך לחזור לדף הפתיחה לחץ <a href=../main/mainpage.asp>כאן</a>.
<%else
c.execute "update CDDatabase set copies=copies - " & qcopies & " where cdno=" & qcd 
c.Execute "insert into Shop(name,cd,ccex,cc,address,copies) values ('"&qname&"','"&qcd&"','"&qccex&"','"&qcc&"','"&qaddress&"','"&qcopies&"')"
response.redirect "../main/mainpage.asp?comment=הזמנתך נקלטה"
end if%>