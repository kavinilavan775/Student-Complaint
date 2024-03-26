<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>STUDENTHOME.COM</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
button {
  background-color: green;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 40%;
}

button:hover {
  opacity: 0.8;
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
<h1><center>WELCOME HOME...</center></h1>
<hr>
<div>
<center><img src="images/studentlogin.jpg" style="height:300px; width: 35%;
  border-radius: 50%;"></center>
 <center> <h1>HI STUDENTS </h1></center>
 
  <!-- Uses jsp file to get name from database  -->


<center>
<a  href="comp.jsp"><button type="submit">UPDATE YOUR PROBLEM</button></a>
 
</center>
</div>




</body>
</html>









