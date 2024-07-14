<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="signupaction.jsp" method="post">
         <input type="text" name="name" placeholder="enter name" required>
         <input type="email" name="email" placeholder="enter email" required>
         <input type="number" name="mobileNumber" placeholder="enter mobile number" required>
         <select name="securityQuestion">
             <option value="what was your first car?">what was your first car?</option>
              <option value="what is the name of your first pet?">what is the name of your first pet?</option>
               <option value="what elementary school did you attend ?">what elementary school did you attend ?</option>
                <option value="what is the name of the town where you were born?">what is the name of the town where you were born?</option>
         </select>
         <input type="text" name="answer" placeholder="enter  answer" required>
         <input type="password" name="password" placeholder="enter password" required>
         <input type="submit" value="signup">
      </form>

      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  
  <%
  String msg=request.getParameter("msg");
  if("valid".equals(msg))
  {
  %>
	  <h1>Successfully registered</h1> 
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