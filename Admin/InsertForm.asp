<!--#include file="../Include/aInclude.asp" -->
<title>הוספת דיסק למאגר</title>
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
{	letok = "אבגדהוזחטיכךלמםנןסעפףצץקרשת- abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,.`'()@!#*&:\/1234567890"
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
function allchk(author,name,year,time,tracks,genre,copies,info)
{	if (author.value='')
	{	alert('שדה שם היוצר ריק')
		return(false)}
	if (name.value=='')
	{	alert('שדה שם היוצר ריק')
		return(false)}
	if (genre.value=='')
	{	alert("שדה הג'אנר ריק")
		return(false)}
	if (insert.namestyle.value=='')
	{	alert('סוג להגדרה לא נבחר')
		return(false)}
	if (year.value=='')
	{	alert('שדה שנת הדיסק ריק')
		return(false)}
	if (insert.enhanced.value=='')
	{	alert('האם יש תוכן דיגיטלי בתקליטור?')
		return(false)}
	if (time.length<=4)
	{	alert('זמן הדיסק שגוי או ריק')
		return(false)}
	if (tracks.value>=1||tracks.value<=22)
	{	alert('מספר השירים חייב להיות גדול מ - 0 וקטן מ - 23')
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
	<h1 align=center>הוספת דיסק למאגר נתונים</h1>
	<form name=insert method=post action=insert.asp 
	onSubmit="return(allchk(insert.author.value,insert.name.value,insert.year.value,insert.alllength.value,insert.t_no.value,insert.style.value,insert.copies.value,insert.info.value))">
	<table><tr><th>אמן:<br>(אנגלית)</th>
	<td valign=top><input name=author size=30></td></tr>
	<tr><th>שם דיסק:<br>(אנגלית)</th><td valign=top>
	<input name=name size=30></td></tr>
	<tr><th>סוג להגדרה:</th><td valign=top><select size=3 name=namestyle>
	<option value=rock>רוק</option><option value=metal>מטאל</option>
	<option value=alternative>אלטרנטיבית</option></select></td></tr>
	<tr>
      <th>סוג דיסק:</th>
      <td valign=top><select size=2 name=type>
	<option value=album>אלבום</option><option value=single>סינגל</option></select></td></tr>
	<tr><th>שנה:<br>(לדוגמה 2001)</th><td valign=top>
	<input name=year maxlength=4 size=4></td></tr>
	<tr><th>זמן השמעה כולל:<br>(לדוגמה 9.05)</th><td valign=top>
	<input name=alllength size=5 maxlength=5></td></tr>
	<tr><th>מספר שירים:</th><td valign=top>
	<input name=t_no maxlength=2 size=2></td></tr>
	<tr><th>ג'אנר:<br>(עברית)</th><td valign=top>
	<input name=style size=30></td></tr>
	<tr><th>מידע:<br>(עברית ואנגלית ללא<br>הגבלת תווים)</th>
	<td valign=top><input name=info size=30 value=""></td></tr>
	<tr><th>תוכן דיגיטלי למחשב:</th><td valign=top>
	<select size=2 name=enhanced><option value=1>יש</option>
	<option value=0>אין</option></select></td></tr>
	<tr><th>עותקים:</th><td valign=top><input name=copies size=4>
	</td></tr></table>
	<input type=submit value=הוסף>
	</form>
<!--#include file="../Include/aIncludedown.asp" -->