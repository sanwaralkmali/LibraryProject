<%@ page import="java.io.IOException"%>
<%@  page import="java.io.PrintWriter"%>
<%@  page import="java.net.URISyntaxException"%>
<%@  page import ="java.sql.Connection"%>
<%@  page import="java.sql.SQLException"%>
<%@  page import="java.sql.Statement"%>
<%@  page import=" java.text.DateFormat"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import ="java.util.Date" %>
<%@ page import="servlet.MyDb"%>
 <%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>


<%@ page import="servlet.MyDb"%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Borrowed book</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="css/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
    
      <%
      String userId=null;
      String sessionId=null;
      if(session.getAttribute("user")== null)
      	response.sendRedirect("index.jsp");
     
      Cookie[] cookies = request.getCookies();
      if(cookies != null){
      	for(Cookie cookie : cookies){
      		if(cookie.getName().equals("user"))
      			userId = cookie.getValue();
      		if(cookie.getName().equals("JSESSIONID"))
      			sessionId = cookie.getValue();	
      	}
      }
           
    %>

        <div id="wrapper">
  
            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="dashboard.jsp">User Panel</a>
                </div>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <ul class="nav navbar-nav navbar-left navbar-top-links">
                    <li><a href="#"><i class="fa fa-home fa-fw"></i> Book Management System </a></li>
                </ul>

                <ul class="nav navbar-right navbar-top-links">
                   
                    <li class="dropdown">
                   
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i>Hi , <%= userId  %> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                           
                            <li class="divider"></li>
                            <li><a href="LogoutUser"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                </span>
                                </div>
                                <!-- /input-group -->
                            </li>
                            <li>
                                <a href="dashboardUser.jsp" class="active"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Books <span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DashboardUser.jsp">List of book</a>
                                    </li>
                                   <li>
                                        <a href="BorrowedBook.jsp">Borrowed book</a>
                                    </li>
                                    
                                    <li>
                                        <a href="availableBooks.jsp">Available books</a>
                                    </li>
                                     
                                  
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                           
                           
                            
                                <!-- /.nav-second-level -->
                           
                        </ul>
                    </div>
                </div>
            </nav>

           
                    
                <!-- /.row -->
            </div>
            <!-- /#page-wrapper -->
 

<div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Borrowed Books</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
 
   <table class="table">
   <thead>
   
    <tr>
    <th>Id</th>
    <th>book_id</th>
    <th>Date borrowed</th>
    <th>user_id</th>
    
   </tr>
    
   </thead>
   
   <tbody>
   
   <%
   MyDb db = new MyDb();
	Connection con=null;
	try {
		con = db.getCon();
	} catch (URISyntaxException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
   
	
		Statement stmt =  con.createStatement();
		ResultSet rs= stmt.executeQuery("SELECT * FROM borrow_table WHERE user_id =(SELECT uid FROM user_table WHERE uname='"+userId+"')");
		
		while(rs.next())
		{
			 %>
			 
			 <tr >
			   <td><%= rs.getString("id") %> </td>
			   <td><%= rs.getString("book_id") %> </td>
			   <td><%= rs.getString("my_date") %> </td>
			   <td><%= rs.getString("user_id") %> </td>
			   <td> <a href="detailBorrowedBook.jsp?du=<%= rs.getString("id") %>"> Detail </a> </td> 
			  
			  
			 </tr>
			 <%
		}
		
		 %>
		
	
   
  
   
   
   </tbody>
   
 
   
   
 
   </table>
    </div>
  </div>
  </div>
                            <!-- /.panel-body -->
       

      
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="js/raphael.min.js"></script>
        <script src="js/morris.min.js"></script>
        <script src="js/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/startmin.js"></script>

    </body>
</html>



