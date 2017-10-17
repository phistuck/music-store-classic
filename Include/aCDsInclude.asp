<%response.buffer=true%>
<basefont face=arial size=3> 
<Style>
A:link, A:visited, A:active { text-decoration: none; color: lightblue}
h1 {  font-size: 36px; color: yellow}
h2 { color=darkred }
h3 { font-size: 18px; color: darkred }
th { color=yellow }
Textarea, Input, Select, Option {font-family: Arial; color: lightblue; background: black; }
</Style>
<%if session("ok")="yes" then%>