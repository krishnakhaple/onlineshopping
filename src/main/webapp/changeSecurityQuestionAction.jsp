<%@page import="project.Connectionprovider" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String securityquestion=request.getParameter("securityquestion");
String answer=request.getParameter("answer");
String password=request.getParameter("password");
int check=0;
try
{
	
Connection con=Connectionprovider.getcon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from users where password='"+password+"' and email='"+email+"'");

while(rs.next())
{
check=1;
  st.executeUpdate("update users set securityquestions='"+securityquestion+"',answer='"+answer+"' where email='"+email+"'");
  response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
}
if(check==0)
{
	response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");

	
}
}
catch(Exception e)
{
	System.out.println(e);
}
%>