<%@page import="project.Connectionprovider" %>
<%@page import="java.sql.*" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
try{
int total=0;
int sno=0;
Connection con=Connectionprovider.getcon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select sum(total) from cart where cart.email='"+email+"'and cart.status='bill'");
while(rs.next())
{
	total=rs.getInt(1);
}

ResultSet rs2=st.executeQuery("select * from users inner join cart where cart.email='"+email+"'and  cart.status='bill'");
while(rs2.next())
{
%>
<h3>Online shopping Bill (MCA Days)</h3>
<hr>
<div class="left-div"><h3>Name: <%=rs2.getString(1) %></h3></div>
<div class="right-div-right"><h3>Email:  <%=rs2.getString(2) %></h3></div>
<div class="right-div"><h3>Mobile Number:<%=rs2.getString(3) %>  </h3></div>  

<div class="left-div"><h3>Order Date:  <%=rs2.getString(21) %> </h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rs2.getString(23) %>  </h3></div>
<div class="right-div"><h3>Expected Delivery: <%=rs2.getString(22) %>  </h3></div> 

<div class="left-div"><h3>Transaction Id: <%=rs2.getString(24) %>  </h3></div>
<div class="right-div-right"><h3>City: <%=rs2.getString(17) %>  </h3></div> 
<div class="right-div"><h3>Address:<%=rs2.getString(16) %>   </h3></div> 

<div class="left-div"><h3>State:<%=rs2.getString(18) %>   </h3></div>
<div class="right-div-right"><h3>Country: <%=rs2.getString(19) %>  </h3></div>  

<hr>
<%break;} %>

	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
  ResultSet rs3=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
  while(rs3.next())
  {
	  sno=sno+1;
  
  %>
  <tr>
    <td><%=sno%></td>
    <td><%=rs3.getString(17)%></td>
    <td><%=rs3.getString(18)%></td>
    <td><%=rs3.getString(19)%></td>
    <td><%=rs3.getString(3)%></td>
    <td><%=rs3.getString(5)%></td>
  </tr>
  <tr>
<%} %>
</table>
<h3>Total: <%=total %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>