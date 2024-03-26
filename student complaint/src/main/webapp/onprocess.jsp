<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>ADMIN.COM</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
table {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

 th {
  border: 1px solid black;
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
td {
  border: 1px solid black;
  padding: 8px; 
}

table tr:hover{background-color:#f2f2f2;}
input[type=text] {
  width: 80%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
.registerbtn{
  background-color: green;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 15%;
}
       .process-button {
                width:80%;
                 margin-top:3%;
                border:1px solid black; 
            padding: 5px 5px;
            cursor: pointer;
            background-color: green;
            color: white;
        }

        
 .process-button:hover {
  background-color:red;
  color:black;
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
<center><h1>Welcome to admin home.....</h1></center><hr><br>
<form action="#" method="post">
<input type="text" name="t1" placeholder="Search On Here....">
    <button type="submit" class="registerbtn">Search</button>
</form>
<br>


<table>
		 <tr>
					<th> Student Name</th>
					<th> Student Regno</th>
					<th> Issue Department </th>
					<th> Issue </th>
					<th> Issue image </th>
					<th> Actions </th>
				</tr>
				
<%
String a=request.getParameter("t1");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con=DriverManager.getConnection
	("jdbc:mysql://localhost:3306/student","root","kavin775");
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("SELECT * FROM compl " +
            "WHERE regno LIKE '%" + a + "%' OR " +
            "department LIKE '%" + a + "%' OR " +
            "issue LIKE '%" + a + "%' OR " +
            "student LIKE '%" + a + "%'");

	while(rs.next())
	{%>	
	
	<tr>	
	                <td name="n1"><%=rs.getString(4) %></td>
					<td name="n2"><%=rs.getString(5) %></td>
					<td name="n3"><%=rs.getString(1) %></td>
					<td name="n4"><%=rs.getString(2) %></td>
					<td name="n5"><%=rs.getString(3) %></td>
					
    <td><div class="container">
    <center><a href="deletestudent.jsp"> <button class="process-button">DELETE<br></a><center></div>
  
    </td></form>
  </tr>
  <%
  }
	
}

	

catch(Exception e)
{
	out.println(e);
}




%>
				
				
				
				</table>


</html>













