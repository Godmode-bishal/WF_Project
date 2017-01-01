
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<% if(session.getAttribute("UID")!=null){ %>

<title>Registration Page</title>
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
//alert(mobno.length);

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



<body oncontextmenu="return false">

	<h1>Customer Registration Form</h1>
	<a href="options.jsp">Back to homepage</a>
	<a href="LServlet">Logout</a><br>
	<div class="ex">
		<form name="registerForm" method="post" action="RegisterServlet" onsubmit="return formValidation()">
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
					<option value="Mr">Mr</option>
					<option value="Ms">Ms</option>
					<option value="Mrs">Mrs</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>First Name: <span><font size="3" color="green">*</font></span></td>
					<td><input type="text" name="firstName" required><span id="error1"></span></td>
				</tr>
				<tr>
					<td>Middle Name: </td>
					<td><input type="text" name="middleName"/></td>
				</tr>
				<tr>
					<td>Last Name: <span><font size="3" color="green">*</font></span></td>
					<td><input type="text" name="lastName" required><span id="error2"></span></td>
				</tr>
				<tr>
					<td>Father's/Husband's Name: <span><font size="3" color="green">*</font></span></td>
					<td><input type="text" name="relation" required><span id="error3"></span></td>
				</tr>
				<tr>
					<td>Permanent Address: <span><font size="3" color="green">*</font></span></td>
					<td><input type="text" name="permanentAddress" required><span id="error4"></span></td>
				</tr>
				<tr>
					<td>Mailing Address: <span><font size="3" color="green">*</font></span></td>
					<td><input type="text" name="mailingAddress" required><span id="error5"></span></td>
				</tr>
				<tr>
					<td>Email: <span><font size="3" color="green">*</font></span></td>`
					<td><input type="email" name="email" required><span id="error6"></span></td>
				</tr>
				<tr>
					<td>Date of Birth: <span><font size="3" color="green">*</font></span></td>
					
					<td><input type="text" name="dob" id="datepicker" required><span id="error7"></span></td>
				</tr>
				<tr>
					<td>Mobile Number: <span><font size="3" color="green">*</font></span></td>
					<td><input min="1000000000" max="9999999999" type="number" pattern=".{10}" name="mobileNo" required></td>
				</tr>
				<tr>
					<td>Gender: <span><font size="3" color="green">*</font></span></td>
					<td>
					<select name="gender" required>
					<option value=""></option>
					<option value="M">Male</option>
					<option value="F">Female</option>
					</select>
					</td>
					
				</tr>
				<tr>
					<td>SSN: <span><font size="3" color="green">*</font></span></td>
					<td><input min="100000000" max="999999999" type="number" maxlength="9" name="ssn" required></td>
				</tr>
				<tr>
					<td>Balance: <span><font size="3" color="green">*</font></span></td>
					<td><input type="number" name="balance" required><span id="error10"></span></td>
				</tr>
			</table>
			<input type="submit" value="Register" class="btn btn-primary" role="button" />
		</form>
	</div>
	 
</body>
<%}
else
{
	response.sendError(401);
}%>	
</html>