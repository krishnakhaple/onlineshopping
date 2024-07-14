<%@page import="project.Connectionprovider" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");

if("done".equals(msg))
{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%
}
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%
}
%>
<%
try
{
Connection con=Connectionprovider.getcon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
while(rs.next())
{
%>
<form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Select Your New Securtiy Question</h3>
 <select class="input-style" name="securityquestion" type="text">
 <option value="what was your first car?">what was your first car?</option>
 <option value="what is name of your first pet?">what is name of your first pet?</option>
 <option value="what elementary school did you attend?">what elementary school did you attend?</option>
 <option value="what is name of town where you were born?">what is name of town where you were born?</option>
 </select>
 <hr>
 
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="answer"  placeholder="enter answer" required>
 
<hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password"  placeholder="enter security password" required>

<hr>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
<%
}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</form>
</body>
<br><br><br>
</html>