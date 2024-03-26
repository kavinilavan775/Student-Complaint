<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.io.PrintWriter" %>
  <%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>COMPLAINT.COM</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">

body {font-family: Arial, Helvetica, sans-serif;}
form {
border: 3px solid green;
 padding: 14px 20px;
 border-radius: 5%;
 float:left;
 width:50%;
}


.container {

  padding: 16px;
   width:100%;
}

.left {
color:white;
 margin-left: 60%;
 margin-top: 3%;
 background-color: grey;
border: 3px solid black;
 padding: 14px 20px;
 width:35%;
 border-radius: 5%;
}
button[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  cursor: pointer;
  width: 100%;
}

button[type=submit]:hover {
  background-color:blue;
}
img {
  height:180px;
  width: 40%;
  border-radius: 50%;
}

input[type=text],select {
  width: 70%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
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
<center><h1>HOW CAN US HELP YOU?..</h1></center>
<hr>
<br>
<div class="form">

<%
    // Get the session
    HttpSession s = request.getSession();   
%>

<!-- form page start from here -->
<form action="#" method="post">
 
<center>
<img src="images/studentlogin.jpg">
</center>
  <div class="container">
  
  <b>SELECT A DEPARTMENT:</b><br>
			<select name="d1">
				<option>MECH</option>
				<option>CIVIL</option>
				<option>CSE</option>
				<option>EEE</option>
				<option>ECE</option>
				<option>MAINTAINANCE</option>
			</select>
		<br>
    <label><b>enter your issue here</b></label>
    <input type="text" placeholder="Enter issue" name="c1" required><br>

    <label><b>upload image</b></label>
    <input type="text" placeholder="image path correctly['abc.jpg']" name="i1">
        
<% 
try
{
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con=DriverManager.getConnection
	("jdbc:mysql://localhost:3306/student","root","kavin775");
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from harish");
	while(rs.next())
	{%>
        
<input type="hidden" value="<%=session.getAttribute("username") %>" name="n1">
<input type="hidden" value="000" name="r1">
<% }
	
	
	
	
}
catch(Exception e)
{
	out.println(e);
}




%>
    <button type="submit">enter</button>
    
</form>


<!-- form page endson here -->

</div>
<div class="left">

 <marquee behavior="scroll" direction="up" scrollamount="5">
        This is a sample scrolling text using <br>the marquee tag. 
        You can customize it 
        <br>based on your needs.<br>
         This is a sample scrolling text using <br>the marquee tag. 
        You can customize it 
        <br>based on your needs.<br>
        This is a sample scrolling text using <br>the marquee tag. 
        You can customize it 
        <br>based on your needs.<br>
         This is a sample scrolling text using <br>the marquee tag. 
        You can customize it 
        </marquee>
        <br><hr>
        <br>
         <marquee behavior="scroll" direction="left" scrollamount="5">
        <br>based on your needs.<br>
        This is a sample scrolling text using <br>the marquee tag. 
        You can customize it 
        <br>based on your needs.<br>
         This is a sample scrolling text using <br>the marquee tag. 
        You can customize it 
        <br>based on your needs.<br>
    </marquee>

</div>


</body>
<%

String a=request.getParameter("d1");
String b=request.getParameter("c1");
String c=request.getParameter("i1");
String d=request.getParameter("n1");
String f=request.getParameter("r1");
if(a!=null && b!=null && c!=null && d!=null && f!=null){
	
	try{
		//choose database
				Class.forName("com.mysql.jdbc.Driver");
				//connect to the database
				Connection con=DriverManager.getConnection
				("jdbc:mysql://localhost:3306/student","root","kavin775");
				//Statement to understand sql query
				Statement st=con.createStatement();
				//insert value to the table
				st.executeUpdate("insert into compl values('"+a+"','"+b+"','"+c+"','"+d+"','"+f+"')");
				out.println("<script>alert('insert sucessfully')</script>");
				response.sendRedirect("studenthome.jsp");
	}catch(SQLException e){
		out.println(e);
	}
}
	
	

%>

</html>
