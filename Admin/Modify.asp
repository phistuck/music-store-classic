<!--#include file="../Include/aInclude.asp" -->
<title>שינוי/עדכון מידע דיסק</title>
<Script>
function ltrchk(usnam) //אימות אותיות, ספרות וסימנים לועזיים
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
function infchk(usnam) //אימות אותיות, ספרות וסימנים
{	letok = "- abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,.`'()@!#*&:\/אבגדהוזחטיכךלמםנןסעפףצץקרשת1234567890"
	w=0
	for (q=0;q<usnam.length;q++)
		{ chna=usnam.charAt(q);
		for (r=0;r<letok.length;r++)
			if (chna==letok.charAt(r))
			w=w+1;			  }
	valid1=(w==usnam.length);
	if (valid1==false)
		return (valid1); }
function hltrchk(usnam) //אימות אותיות, ספרות וסימנים עבריים
{	letok = "- אבגדהוזחטיכךלמםנןסעפףצץקרשת,.`'\/1234567890"
	w=0
	for (q=0;q<usnam.length;q++)
		{ chna=usnam.charAt(q);
		for (r=0;r<letok.length;r++)
			if (chna==letok.charAt(r))
			w=w+1;			  }
	valid1=(w==usnam.length);
	if (valid1==false)
		return (valid1); }
function numchk(str) //אימות ספרות בלבד
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
	{	alert('שדה טקסט השינוי ריק!! איך בידיוק אפשר לשנות אם אין מה???')
		return(false)}
	if (choice=='name')
	{	if (chk(record)==false)
		{	alert('נתון השינוי שהוקש אינו תואם שדה זה')
			return(false)}}
	if (choice=='author')
	{	if (chk(record)==false)
		{	alert('נתון השינוי שהוקש אינו תואם שדה זה')
			return(false)}}
	if (choice=='')
	{	if (chk(record)==false)
		{	alert('נתון השינוי שהוקש אינו תואם שדה זה')
			return(false)}}
	if (choice=='')
	{	if (chk(record)==false)
		{	alert('נתון השינוי שהוקש אינו תואם שדה זה')
			return(false)}}
	if (choice=='t_no')
	{	if (tracks.value>=1||tracks.value<=22)
		{	alert('מספר השירים חייב להיות גדול מ - 0 וקטן מ - 23')
			return(false)}
		if (numchk(record)==false)
		{	alert('נרשם מספר לא חוקי')
			return(false)}}}
function songchk(name,length)
{	if (name=='')
	{	alert('חובה להזין את שם השיר')
		return(false)}
	if (length='')
	{	alert('חובה להזין את זמן השיר')
		return(false)}
	if (ltrchk(name)==false)
	{	alert('שם השיר אינו חוקי')
		return(false)}
	if (numchk(length)==false)
	{	alert('זמן השיר אינו חוקי')
		return(false)} }
</Script>
	<form name=modify method=post action=update.asp 
	onSubmit="return(allchk(modify.updatechoice.value,modify.record.value))">
	<input name=cdno type=hidden value=<%=request.querystring("cdno")%>>
	מה ברצונך לשנות?<br><select name=updatechoice>
	<option value=name>שם הדיסק</option>
	<option value=author>שם היוצר</option>
	<option value=t_no>מספר השירים</option>
	<option value=info>מידע על הדיסק</option>
	<option value=alllength>זמן כולל</option>
	<option value=year>שנה</option>
	<option value=enhanced>תוכן דיגיטלי</option>
	<option value=style>ג'אנר</option>
	<option value=namestyle>סוג סידורי</option>
	<option value=copies>מספר עותקים</option></select>
	<br><input name=record><input type=submit value=עדכן></form>
<%set c=server.createObject("ADODB.Connection")
c.open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../../db/data.mdb")
r = c.execute ("select*from CDDatabase where cdno=" & request.querystring("cdno"))%>
	לשינוי שמות וזמני שירים: (בשליחה יעביר אותך לעמוד הדיסק)
	<form method=post action=trackins.asp name="smodify" onsubmit="return(songchk(smodify.tname.value,smodify.tlength.value))">
	בחר מספר שיר: <select name=trackno><%for tracks=1 to r("t_no")%><option value=t<%=tracks%>>שיר מספר <%=tracks%></option>
<%next%>
	</select><br>שם השיר: <input name=tname><br>זמן השיר:<input name=tlength size=5><br>
	<input type=submit value="שנה מידע על השיר"><input type=hidden name=cdno value="<%=request.querystring("cdno")%>">
	</form>
<!--#include file="../Include/aIncludedown.asp" -->