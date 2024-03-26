<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>REGISTER.COM</title>
</head>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password],input[type=email],input[type=number] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus ,input[type=email]:focus, input[type=number]:focus{
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
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

<form action="#" method="post">
  <div class="container">
    <h1><center>Register</center></h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
   
    <label><b>NAME</b></label>
    <input type="text" placeholder="Enter Name" name="n1" required><br>

    <label><b>EMAIL</b></label>
    <input type="email" placeholder="Enter Email" name="e1" required><br>

    <label><b>REGISTER NUMBER</b></label>
    <input type="number" placeholder="Enter Registernumber" name="r1" required><br>
   
    
    
    <label><b>MOBILE NUMBER</b></label>
    <input type="number" placeholder="Enter mobilenumber" name="m1" required><br>
    
    <label><b>PASSWORD</b></label>
    <input type="text" placeholder="Enter Password" name="p1" required><br>
    <hr>
    
    <button type="submit" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="login.jsp">Sign in</a>.</p>
  </div>
</form>
</body>
</html>

<%
    String a = request.getParameter("n1");
    String b = request.getParameter("e1");
    String c = request.getParameter("r1");
    String d = request.getParameter("m1");
    String f = request.getParameter("p1");


    if(a!=null && b!=null && c!=null && d!=null && f!=null){
    	//choose database
    			Class.forName("com.mysql.jdbc.Driver");
    
    String jdbcUrl = "jdbc:mysql://localhost:3306/student";
    String dbUsername = "root";
    String dbPassword = "kavin775";

    try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
        String checkSql = "SELECT * FROM harish WHERE regno=?";
        try (PreparedStatement checkStatement = connection.prepareStatement(checkSql)) {
            checkStatement.setString(1, c);

            ResultSet checkResult = checkStatement.executeQuery();

            if (checkResult.next()) {
                if (checkResult.getString("regno").equals(c)) {
                    out.println("<p><center>Regnumber already exist already exist.</center></p>");
                } else {
                    out.println("<p>Data conflict. Please choose a different value for param1.</p>");
                }
            } else {
                String insertSql = "INSERT INTO harish (sname, email, regno, mnumber, pword) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement insertStatement = connection.prepareStatement(insertSql)) {
                    insertStatement.setString(1, a);
                    insertStatement.setString(2, b);
                    insertStatement.setString(3, c);
                    insertStatement.setString(4, d);
                    insertStatement.setString(5, f);

                    int rowsAffected = insertStatement.executeUpdate();

                    if (rowsAffected > 0) {
                    	out.println("<script>alert('registered sucessfully')</script>");
                    } else {
                        out.println("<p>Error inserting data</p>");
                    }
                }
            }

            checkResult.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
    }
%>

		







