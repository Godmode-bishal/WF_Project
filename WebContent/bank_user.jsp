<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bank User</title>
</head>
<body align="middle">
<h1>Bank User Login</h1><br><br><br>
<form action="" method="post">
<input type="text" placeholder="Enter ID" name="eid" required><br>
<input type="text" placeholder="Enter password" name="epwd" required><br><br>
<input type="submit" value="Submit">
</form>
<body>


<%
  String str1=request.getParameter("eid");
  String str2=request.getParameter("epwd");

  if((str1!=null || str2!=null))
  {
	  if(str1.equalsIgnoreCase("eid") && (str2.equalsIgnoreCase("epwd")))
	  {%>
			<jsp:forward page="options.html" />
	  <%} 
  	  
	  else
	  {
	    out.println("<h3>Sorry, you are INVALID</h3>");    
	  }
  }%>
</body>
</body>
</html>