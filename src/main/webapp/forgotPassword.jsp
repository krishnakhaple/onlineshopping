<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  
  <form action="ForgotPasswordAction.jsp" method="post">
    <input type="email" name="email" placeholder="enter email here" required>
    <input type="number" name="mobileNumber" placeholder="enter mobile number here" required>
    <select name="securityQuestions">
       <option value="what was your first car?">what was your first car?</option>
       <option value="what is the name of your first pet?">what is the name of your first pet?</option>
       <option value="what elementary school did you attend ?">what elementary school did you attend ?</option>
       <option value="what is the name of the town where you were born?">what is the name of the town where you were born?</option>
    </select>
   <input type="text" name="ans" placeholder="enter your answer" required>
   <input type="password" name="newpassword" placeholder="enter your new password" required>
   <input type="submit" value="save">
   
  </form>
     
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
  
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h1>Password Changed Successfully!</h1>
<%
}
if("invalid".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%
}
%>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>