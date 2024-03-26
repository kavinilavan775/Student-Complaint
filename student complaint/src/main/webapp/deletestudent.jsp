<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DELETE.COM</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.container{
    padding-top:50px;
}

	form {
border: 3px solid black;
 padding: 35px 35px;

 width:40%;

}
	input[type=text] {
		padding: 5px;
	}
	input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  cursor: pointer;
 
}

input[type=submit]:hover {
  background-color:red;
}
li:hover{
background-color:white;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-light">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="login.jsp">STUDENT LOGIN</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="adminlogin.jsp">ADMIN LOGIN</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp">LOGOUT</a>
      </li>
     </ul>
     </div>
     </nav><br>
<hr>
<br>
<center><b>DELETE STUDENT</b></center>
<br><hr>
<div class="container">
     <center> <form action="#" method="post">
	       
				
					<b>Student regno:</b><input type="text" name="r1" placeholder="Enter Student regn...">
				
				<br><br>
				<b>Student name</b><input type="text" name="n1"  placeholder="Enter Student name...">
				
				<br><br>
				
					<input type="submit" value="delete">
				</tr>
			</table>
		</form></center>
</div>

<%
String a=request.getParameter("r1");
String b=request.getParameter("n1");



if(a!=null && b!=null){
	try{
		
		//choose database
		Class.forName("com.mysql.jdbc.Driver");
		//connect to the database
		Connection con=DriverManager.getConnection
		("jdbc:mysql://localhost:3306/student","root","kavin775");
		//Statement to understand sql query
		Statement st=con.createStatement();
		//insert value to the table
		ResultSet rs=st.executeQuery("select * from harish where regno='"+a+"' and sname='"+b+"' ");
		if(rs.next()){
			out.println("<script>alert('Removed sucessfully')</script>");
		}else{
			out.println("<br><center><b> ***check the name and regno***</b></center>");
		}
	}catch(SQLException e){
		out.println(e);
	}
	}

%>


</body>
</html>







