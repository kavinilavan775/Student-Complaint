<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FORGOT.COM</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<body>

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
<hr><br>
<center><h2>FORGOT PASSWORD</h2></center><br>
<hr>

<form action="#" method="post">
 

  <div class="container">
    <label><b>Student Name</b></label>
    <input type="text" placeholder="Enter Studentname" name="n1" required>

    <label><b>REGISTER NUMBER</b></label>
    <input type="text" placeholder="Enter Registernumber" name="p1" required>
        
    <button type="submit">SUBMIT</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>
  </form>

<%
String a=request.getParameter("n1");
String b=request.getParameter("p1");

if(a!=null && b!=null){
	try{
		//chooose database
		Class.forName("com.mysql.jdbc.Driver");
		//connect database
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","kavin775");
		//statement to understand query
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from harish where sname='"+a+"' and regno='"+b+"' ");
		if(rs.next()){
			out.println(rs.getString(5));
		}else{
			out.println("the given uername is wrong");
		}
	}catch(Exception e){
		out.println(e);
	}
}


%>




</body>
</html>













