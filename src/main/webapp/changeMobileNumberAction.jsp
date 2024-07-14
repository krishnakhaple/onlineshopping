<%@page import="project.Connectionprovider" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String mobilenumber=request.getParameter("mobilenumber");
String password=request.getParameter("password");
int check=0;
try
{
	Connection con=Connectionprovider.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		st.executeUpdate("update users set mobileNumber='"+mobilenumber+"' where password='"+password+"' and email='"+email+"'");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
		System.out.println("2");
		
	}
	if(check==0)
	{
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
		System.out.println("3");
	}
	
}
catch(Exception e)
{
	System.out.println(e);
}

%>