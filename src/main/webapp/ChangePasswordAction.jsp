<%@page import="project.Connectionprovider" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String oldpassword=request.getParameter("oldPassword");
String newpassword=request.getParameter("newPassword");
String confirmpassword=request.getParameter("confirmPassword");

if(!confirmpassword.equals(newpassword))
{
	response.sendRedirect("changePassword.jsp?msg=notMatch");
}
else
{
	int check=0;
	try
	{
		Connection con=Connectionprovider.getcon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+oldpassword+"'");
		
		while(rs.next())
		{
			check=1;
			st.executeUpdate("update users set password='"+newpassword+"' where email='"+email+"'");
			response.sendRedirect("changePassword.jsp?msg=done");
		}
		if(check==0)
		{
			response.sendRedirect("changePassword.jsp?msg=wrong");
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
}
%>