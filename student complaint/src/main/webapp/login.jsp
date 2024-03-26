<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="jakarta.servlet.http.HttpSession" %>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="ISO-8859-1">
<title>LOGIN>COM</title>

<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

/*img.avatar {
  width: 40%;
  border-radius: 50%;
}*/

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}
li:hover{
background-color:white;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
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
     </nav>
<br>
<hr><br>
<center><h2>Student Login Form</h2></center><br>
<hr>

<form action="#" method="post">
 

  <div class="container">
    
    <label><b>Register number</b></label>
    <input type="text" placeholder="Enter Username" name="r1" required>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="p1" required>
        
    <button type="submit">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw"><a href="forgot.jsp">Forgot password?</a></span>
     <center><a href="register.jsp">CREATE AN ACCOUNT..</a></center>
  </div>
</form>

</body>

<%
String a=request.getParameter("r1");
String b=request.getParameter("p1");



if(a!=null && b!=null && b!=null){
	try{
		
		//choose database
		Class.forName("com.mysql.jdbc.Driver");
		//connect to the database
		Connection con=DriverManager.getConnection
		("jdbc:mysql://localhost:3306/student","root","kavin775");
		//Statement to understand sql query
		Statement st=con.createStatement();
		//insert value to the table
		ResultSet rs=st.executeQuery("select * from harish where regno='"+a+"' and pword='"+b+"' ");
		if(rs.next()){
			HttpSession h = request.getSession();
			h.setAttribute("username", a);
			response.sendRedirect("studenthome.jsp");
		}else{
			response.sendRedirect("login.jsp");
		}
	}catch(SQLException e){
		out.println(e);
	}
	}

%>


</html>
