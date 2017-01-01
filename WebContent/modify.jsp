<%@ page import="java.sql.*"%>
<%
	String cid = "";
	Class.forName("oracle.jdbc.OracleDriver");
%>

<html>
<% if(session.getAttribute("UID")!=null){ %>
<head>

<title>Edit Customer</title>

    <link rel="stylesheet" href="css/reset.css">

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

        <link rel="stylesheet" href="css/style.css">
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script type="text/javascript">
	function modtable() {

		var x = document.getElementById('myDiv1');
		x.style.display = 'block';
		x.style.visibility = 'visible';
		var y = document.getElementById('myDiv2');
		y.style.display = 'block';
		y.style.visibility = 'visible';
		var z = document.getElementById('myDiv3');
		z.style.display = 'block';
		z.style.visibility = 'visible';
		var i = document.getElementById('myDiv4');
		i.style.display = 'block';
		i.style.visibility = 'visible';

	}
</script>

<script type="text/javascript">
	function validateCust() {

		var id = document.custID.custid.value;
		if (id == "") {
			document.getElementById("Error").innerHTML = "Enter Customer ID!";
			return false;
		}
	}
</script>
<script>
	function preventBack() {
		window.history.forward();
	}
	setTimeout("preventBack()", 0);
	window.onunload = function() {
		null
	};
</script>
<!-- <script type="text/javascript">
	function displayError() {
		alert("This Customer ID does not exist!");
		
	}
</script> -->
<!-- <script type="text/javascript">
	function displayError() {
		alert("The Customer Account is deleted successfully!");
		
	}
</script> -->
<script> function sure(){
	if(confirm("Are you sure?")== true)
		return true;
	else
		return false;
}</script>

</head>

<body oncontextmenu="return false">
	<a href="options.jsp">Back to homepage</a>
	<a href="LServlet">Logout</a>
	<br>
	<br>
	<br>
	<br>
	<h4>Edit Customer</h4>
	<hr>
	<form name="form1" action="" method="post" onsubmit="return validateCust()">

		<table>
			<tr>
				<td>Customer ID: <span><font size="3" color="green">*</font></span></td>
				<td><input type="text" name="custid"
					placeholder="Enter Customer ID" /><font size="3" color="red"><span
						id="error"> </span></font></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit" onclick="modtable();" class="btn btn-success"/></td>
			</tr>
		</table>
	</form>
	<%
		//String custid ="10"; 
		String custid=request.getParameter("custid");
		String a="";
		
		if((custid!=""))
		{
			try{
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ON_BK_SYS", "wellsfargo");
		Statement stmt = conn.createStatement();
		 ResultSet rs = stmt.executeQuery("select count(*) as rowcount from customer where customer_id="+custid);
		while (rs.next()) {
			int rc = rs.getInt("rowcount");
			if (rc == 0 ) {
				out.print("<style>h3 { border: 2px solid black; border-radius: 5px;} </style><div name=\"myDiv4\" ><span><font size=\"3\" color=\"red\"><h3>Enter valid Customer ID!</h3></font></span></div>");
			} 
		} 
			ResultSet rs1 = stmt.executeQuery("select * from customer where  CUSTOMER_ID=" +custid);
		while (rs1.next()) {
			cid = rs1.getString(1);
			if(rs1.getString(4)==null){
				 a = "";
			}else{
				a=rs1.getString(4);
			}
	%>

	<hr>

	<div id='myDiv1'>
		<table class="table">
		<thread>
			<tr>
				<td>Customer ID</td>
				<td>Title</td>
				<td>First Name</td>
				<td>Middle Name</td>
				<td>Last Name</td>
				<td>Father's/Husband's Name</td>
				<td>Permanent Address</td>
				<td>Mailing Address</td>
				<td>E-Mail</td>
				<td>DOB</td>
				<td>Mobile No.</td>
				<td>Gender</td>
				<td>SSN</td>
				<td>Modify</td>
			</tr>
			</thread>
			<tbody>
			<tr class="danger">
				<td><%=rs1.getString(1)%></td>
				<td><%=rs1.getString(2)%></td>
				<td><%=rs1.getString(3)%></td>
				<td><%=a%></td>
				<td><%=rs1.getString(5)%></td>
				<td><%=rs1.getString(6)%></td>
				<td><%=rs1.getString(7)%></td>
				<td><%=rs1.getString(8)%></td>
				<td><%=rs1.getString(9)%></td>
				<td><%=rs1.getString(10)%></td>
				<td><%=rs1.getString(11)%></td>
				<td><%=rs1.getString(12)%></td>
				<td><%=rs1.getString(13)%></td>
				<td><form action="custmodify" method="post">
						<input name="custid" type="hidden" value="<%=cid%>"> <input
							type="submit" Value="Modify" class="btn btn-success"/>
					</form></td>
			</tr>
			</tbody>
		</table>
	</div>
	<span style="display: block; height: 50px;"></span>


	<div id='myDiv2'>
		<table class="table">
		<thread>
			<tr>
				<td>Account No.</td>
				<td>Account Type</td>
				<td>Balance</td>
				<td>Close</td>
			</tr>
			</thread>
			<%
				}
				conn.commit();
				Statement stmt2 = conn.createStatement();
				ResultSet rs2 = stmt2.executeQuery("select * from accounts where  CUSTOMER_ID=" +custid);
				while (rs2.next()) {
			%>
			<tbody>
			<tr class="success">
				<td><%=rs2.getString(1)%></td>
				<td><%=rs2.getString(2)%></td>
				<td><%=rs2.getString(3)%></td>
				<td><form action="accclose" method="post" onsubmit=" return sure()">
						<input name="accno" type="hidden" value="<%=rs2.getString(1)%>" />
						<input name="custid" type="hidden" value="<%=rs2.getString(4)%>" />
						<input type="submit" value="Close" id="clo" class="btn btn-success" />
					</form></td>
			</tr>
			</tbody>

			<%
				}
				conn.commit();
				ResultSet rs3 = stmt.executeQuery("select * from customer where  CUSTOMER_ID=" +custid);
				while(rs3.next()){
			%>
		</table>
	</div>
	<span style="display: block; height: 50px;"></span>
	<div name="myDiv3">
		<form action="accadd" method="post">
			<input name="custid" type="hidden" value="<%=rs3.getString(1)%>">
			<input type="submit" Value="Add Account" class="btn btn-primary"/>
		</form>
		<span style="display: block; height: 20px;"></span>
		<form action="delcust" method="post" onsubmit=" return sure()">
			<input name="custid" type="hidden" value="<%=rs3.getString(1)%>">
			<input type="submit" Value="Delete Customer Profile"  class="btn btn-primary"/>
		</form>
	</div>



</body>
<%
				}
		
	
conn.commit();
rs3.close();
rs2.close();
rs1.close();
//rs.close();
stmt.close();
conn.close();
}catch(Exception e){
	e.printStackTrace();
	out.print("<div name=\"myDiv4\" ><span><font size=\"3\" color=\"red\"><h3>Invalid Customer ID!<h1></font></span></div>");
			
		}
}else{
	out.print("<style>h3 { border: 2px solid black; border-radius: 5px;} </style> <span><font size=\"3\" color=\"red\"><h3>Enter a Customer ID!</h3></font></span>");
}
		}
else
{
	response.sendError(401);
}%>
</html>