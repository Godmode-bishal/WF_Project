<%@ page import="java.sql.*"%>
<%
	
	Class.forName("oracle.jdbc.OracleDriver");
%>
<!DOCTYPE html>
<html>
<% if(session.getAttribute("UID")!=null){%>
<head>
<meta charset="ISO-8859-1">


<title>Modify Page</title>
    <link rel="stylesheet" href="css/reset.css">
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    	<link href="bower_components/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
		<link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    	<link href="css/bootstrap-social.css" rel="stylesheet">

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

        <link rel="stylesheet" href="css/style.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
  <script>
  function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload=function(){null};
</script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({dateFormat: 'mm/dd/yy'});
  } );
  </script>
<script type="text/javascript">
function formValidation()  
{  
//var customerId = document.registerForm.customerId.value; 
var title = document.registerForm.title.value;
var firstName = document.registerForm.firstName.value;
var middleName = document.registerForm.middleName.value;
var lastName = document.registerForm.lastName.value;
var relation = document.registerForm.relation.value;
var perAddress = document.registerForm.permanentAddress.value;
var mailAddress = document.registerForm.mailingAddress.value;
var email = document.registerForm.email.value;
var dob = document.registerForm.dob.value;
var mobno = document.registerForm.mobileNo.value;
var gender = document.registerForm.gender.value;
var ssn = document.registerForm.ssn.value;
var balance = document.registerForm.balance.value;

/* 
if(customerId.length>8){
	//alert("Customer Id must have exactly 8 digits");
	document.getElementById("error").innerHTML="Please enter exactly 8 digits for Customer ID!!!";
    return false;
} */
if(balance<5000)
{
document.getElementById("error10").innerHTML="Starting balance must be atleast 5000!!!";
return false;
}
}  
</script>
</head>
<style>
div.ex {
	text-align: right width:300px;
	padding: 10px;
	border: 5px solid grey;
	margin: 0px
}
</style>
<%
String custid = request.getParameter("custid");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ON_BK_SYS", "wellsfargo");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from customer where customer_id=" + custid );
while(rs.next()){
	String S = rs.getString("dob").substring(0,10).replaceAll("-","/");
	String S1 = S.substring(0,4);
	String S2 = S.substring(5,7);
	S = S2+"/"+S.substring(8)+"/"+S1;
	
%>


<body oncontextmenu="return false">
<a href="options.jsp">Back to homepage</a>
	<a href="LServlet">Logout</a><br><br><br><br>
	<h1>Customer Modification Form</h1>
	<a href="LServlet">Logout</a><br>
	<div class="ex">
		<form name="registerForm" method="post" action="UpdateServlet" onsubmit="return formValidation()">
			<table style="with: 50%">
			<!-- 
				<tr>
					<td>Customer ID: <span><font size="3" color="green">*</font></span></td>
					<td><input type="text" name="customerId" placeholder="Enter Customer ID"/>
					<font size="3" color="red"><span id="error"></span></font>
					
					</td>
					
				</tr> -->
				<tr>
					<td>Title: <span><font size="3" color="green">*</font></span></td>
					<td>
					<select name="title" required>
					<option value=""></option>
					<option value="mr">Mr</option>
					<option value="ms">Ms</option>
					<option value="mrs">Mrs</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>First Name: <span><font size="3" color="green">*</font></span></td>
					<td><input type="text" name="firstName" value="<%=rs.getString("first_name")%>" required/></td>
				</tr>
				<tr>
					<td>Middle Name: </td>
					<td><input type="text" name="middleName" value="<%=rs.getString("middle_name")%>"/></td>
				</tr>
				<tr>
					<td>Last Name: <span><font size="3" color="green">*</font></span></td>
					<td><input type="text" name="lastName" value="<%=rs.getString("last_name")%>" required/></td>
				</tr>
				<tr>
					<td>Father's/Husband's Name: <span><font size="3" color="green">*</font></span></td>
					<td><input type="text" name="relation" value="<%=rs.getString("father_name")%>" required/></td>
				</tr>
				<tr>
					<td>Permanent Address: <span><font size="3" color="green">*</font></span></td>
					<td><input type="text" name="permanentAddress" value="<%=rs.getString("permanent_address")%>" required/></td>
				</tr>
				<tr>
					<td>Mailing Address: <span><font size="3" color="green">*</font></span></td>
					<td><input type="text" name="mailingAddress" value="<%=rs.getString("mailing_address")%>" required/></td>
				</tr>
				<tr>
					<td>Email: <span><font size="3" color="green">*</font></span></td>
					<td><input type="email" name="email" value="<%=rs.getString("email")%>" required/></td>
				</tr>
				<tr>
					<td>Date of Birth: <span><font size="3" color="green">*</font></span></td>
					
					<td><input type="text" name="dob" id="datepicker" value="<%=S%>"/></td>
				</tr>
				<tr>
					<td>Mobile Number: <span><font size="3" color="green">*</font></span></td>
					<td><input type="number" name="mobileNo" max="9999999999" min="1000000000" value="<%=rs.getString("mob_no")%>" required/></td>
				</tr>
				<tr>
					<td>Gender: <span><font size="3" color="green">*</font></span></td>
					<td>
					<select name="gender" required>
					<option value="<%=rs.getString("gender")%>"></option>
					<option value="M">Male</option>
					<option value="F">Female</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>SSN: <span><font size="3" color="green">*</font></span></td>
					<td><input type="number" max="999999999" min="100000000" name="ssn" value="<%=rs.getString("ssn")%>" required/></td>
				</tr>
			</table>
			<input name="custid" type="hidden" value="<%=custid%>"> 
			<input type="submit" value="Save" role="button" class="btn btn-primary"/>
		</form>
	</div>
	</body>
	<%}
conn.commit();
rs.close();
stmt.close();
conn.close();
}
else
{
	response.sendError(401);
}%>

</html>