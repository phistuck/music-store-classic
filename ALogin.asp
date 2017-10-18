<%if session("ok")="yes" then
response.redirect "admin/admin.asp"
end if%>
<title>חיבור למדור הניהול</title>
<!--#include file="Include/Include.asp" -->
<Script>
function chk(un) //בדיקת אותיות (עברית ואנגלית)
{	letok="abcdefghijklmnopqrstuvwxyzאבגדהוזחטיכלמנסעפצקרשת1234567890"
	w=0
	for (q=0;q<un.length;q++)
		{ chna=un.charAt(q);
		for (r=0;r<letok.length;r++)
			if (chna==letok.charAt(r))
			w=w+1;			  }
	valid=(w==un.length);
	return (valid) }
</Script>
	<form name=login action=admin/Confirm.asp method=post onSubmit="return(chk(login.un.value))">
		שם משתמש: <input name=un><BR>
		סיסמה: <input type=password name=pw><BR>
		<input type=submit value=התחבר>
	</form>