<%@page import="project.Connectionprovider"%>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String mobileNumber=request.getParameter("mobileNumber");
String securityQuestions=request.getParameter("securityQuestions");
String ans=request.getParameter("ans");
String newpassword=request.getParameter("newpassword");
int check=0;

try
{
	Connection con=Connectionprovider.getcon();
	Statement st=con.createStatement();
	 ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and mobileNumber='"+mobileNumber+"' and securityquestions='"+securityQuestions+"' and answer='"+ans+"'  ");
	 
	 while(rs.next())
	 {
		 check=1;
		 st.executeUpdate("update users set password='"+newpassword+"' where email='"+email+"'");
		 response.sendRedirect("forgotPassword.jsp?msg=done");
		 System.out.println("miketestcheck1");
		 
	 }
	if(check==0)
	{
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
}
catch(Exception e)
{
	System.out.println(e);
	 
}


%>