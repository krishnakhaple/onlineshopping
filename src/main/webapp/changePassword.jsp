<%@page import="project.Connectionprovider" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("notMatch".equals(msg))
{
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%
}
else if("wrong".equals(msg))
{
%>
<h3 class="alert">Your old Password is wrong!</h3>
<%
}
else if("done".equals(msg))
{
%>
<h3 class="alert">Password change successfully!</h3>
<%
}
else if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%
}
%>
<form action="ChangePasswordAction.jsp" method="post">
<h3>Enter Old Password</h3>
<input class="input-style" type="password" name="oldPassword" placeholder="enter old password" required>
  <hr>
 <h3>Enter New Password</h3>
 <input class="input-style" type="password" name="newPassword" placeholder="enter new password" required>
 <hr>
<h3>Enter Confirm Password</h3>
<input class="input-style" type="password" name="confirmPassword" placeholder="enter confirm password" required>
<hr>
 <button class="button" type="submit" value="click">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>