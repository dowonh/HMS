<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	    String username = (String)session.getAttribute("user");
		String userType = (String)session.getAttribute("type");
		if(!(username!=null && username.equals("admin") && userType.equals("admin")))
			response.sendRedirect("../index.jsp");	
			
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Panel</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/simple-sidebar.css" rel="stylesheet">
    <script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js"></script>
	
</head>

<body>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                        Admin Menu
                    </a>
                </li>
                <li>
                    <a href="adminpanel.jsp?page=dashboard">Dashboard</a>
                </li>
                <li>
                    <a href="adminpanel.jsp?page=usermgmt">Manage Users</a>
                </li>
                <li>
                    <a href="../logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <%
        	if( request.getParameter("page")==null || request.getParameter("page").equals("dashboard")){
        	
        %>
        	<div id="page-content-wrapper">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-lg-12">
	                        <h1>Welcome to Admin Panel.</h1>
	                        <a href="#menu-toggle" class="btn btn-default" id="menu-toggle"><<</a>
	                    </div>
	                </div>
	            </div>
	        </div>
        <% } 
        else if(request.getParameter("page").equals("usermgmt")){
        %>
        	<div id="page-content-wrapper">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-lg-12">
	                        <h1>Manage Users</h1>
	                        <%@ include file="displayData.jsp" %>
	                    </div>
	                </div>
	            </div>
	        </div>
        <% } %>
        <!-- /#page-content-wrapper -->

    </div>
    

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>