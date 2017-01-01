<html>
<head>
<meta charset="ISO-8859-1">
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bishal Mazumdar</title>
        <link rel="icon" type="image/png" href="image/logo.png">
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="bower_components/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/bootstrap-social.css" rel="stylesheet">
        <link href="css/mystyles.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="styles.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
      <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
      <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
 
    <link rel="stylesheet" href="css/reset.css">

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

        <link rel="stylesheet" href="css/style.css">

<script>
  function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload=function(){null};
</script>
</head>
<body oncontextmenu="return false">
<% if(session.getAttribute("UID")!=null){ 
//Cookie c = new Cookie("a","0");
%>
<a href="LServlet">Logout</a><br><br><br><br>
<div class="container">
<a href="register.jsp" role="button" class="btn btn-warning btn-lg btn-block">Register new Customer</a><br><br>
<a href="modify.jsp" role="button" class="btn btn-warning btn-lg btn-block">Modify Customer details</a><br><br>
<a href="modify.jsp" role="button" class="btn btn-warning btn-lg btn-block">Delete Customer Profile</a><br><br>
<a href="modify.jsp" role="button" class="btn btn-warning btn-lg btn-block">Add New Account Type</a><br><br>
<a href="modify.jsp" role="button" class="btn btn-warning btn-lg btn-block">Close Existing Account Type</a><br><br>
</div>
<%}
else
{
	response.sendError(401);
}%>
</body>
</html>