<%@ page import="java.sql.*"%>
<%
	Class.forName("oracle.jdbc.OracleDriver");
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/reset.css">

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

        <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<% if(session.getAttribute("UID")!=null){ %>
<script>
  function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload=function(){null};
</script>

</head>
<body oncontextmenu="return false">
	<a href="options.jsp">Back to homepage</a>
	<a href="LServlet">Logout</a><br><br><br><br>
	<h4>Add Account</h4>
	<hr>

	<form action="addconfirm" method="post" name="addAccForm">
		<table>
			<tr><td>Customer ID</td><td><input type="number" name="custid" value="<%=request.getParameter("custid")%>" readonly></td></tr>
			
			<tr><td>
				<label for="account">Account: </label> <select name="account">
				<% 
				int sav=0,cur=0,sal=0;
				String custid=request.getParameter("custid");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ON_BK_SYS", "wellsfargo");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select account_type from accounts where customer_id="+custid);
				while(rs.next()){
				if(rs.getString(1)=="Savings"){
					sav=1;
				} 
				if(rs.getString(1)=="Current"){
					cur=1;
				}
				if(rs.getString(1)=="Salary"){
					sal=1;
				}}
				 if(sav==0){
				%>
				<option value="Savings">Savings</option>
				<%} 
				 if(cur==0){
				%>
					<option value="Current">Current</option>
				<%}
				 if(sal==0){
				%>
				<option value="Salary">Salary</option>
				<%} %>
				</select>
				</td></tr>
				
			<tr>
					<td>Balance: </td>
					<td><input type="number" min="5000" name="balance" required><span id="error1"></span></td>
				</tr>
			 <tr>
				<td colspan='2'><input type="submit" value="Submit" class="btn btn-success"></td>
			</tr>
		</table>
		
	</form>
	<hr>
</body>
<%
conn.commit();
rs.close();
stmt.close();
conn.close();}


else
{
	response.sendError(401);
}%>
</html>
