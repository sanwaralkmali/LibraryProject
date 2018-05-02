 <%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="servlet.MyDb"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.net.URISyntaxException" %>
 
 
 <%
   MyDb db = new MyDb();
	Connection con=null;
	String value = null;
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
		ResultSet rs= stmt.executeQuery("SELECT COUNT(*)AS total FROM book_table");
		int i = 0;
		while (rs.next()){
		
		 i= rs.getInt("total");
		}
	%>	
	
	
	
	
	<%
   MyDb db2 = new MyDb();
	Connection con2=null;
	String value2 = null;
	try {
		con = db2.getCon();
	} catch (URISyntaxException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
   
	  
		Statement stmt2 =  con.createStatement();
		ResultSet rs2= stmt.executeQuery("SELECT COUNT(*)AS total FROM user_table");
		int j = 0;
		while (rs2.next()){
		
		 j= rs2.getInt("total");
		}
	%>	
	
	
	<%
   MyDb db3 = new MyDb();
	Connection con3=null;
	String value3 = null;
	try {
		con3 = db3.getCon();
	} catch (URISyntaxException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
   
	  
		Statement stmt3 =  con.createStatement();
		ResultSet rs3= stmt.executeQuery("SELECT COUNT(*)AS total FROM borrow_table");
		int k = 0;
		while (rs3.next()){
		
		 k= rs3.getInt("total");
		}
		
	%>	
	
	<%
   MyDb db4 = new MyDb();
	Connection con4=null;
	String value4 = null;
	try {
		con4 = db4.getCon();
	} catch (URISyntaxException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
   
	  
		Statement stmt4 =  con.createStatement();
		ResultSet rs4= stmt4.executeQuery("SELECT COUNT(*)AS total FROM book_table WHERE state = TRUE");
		int l = 0;
		while (rs4.next()){
		
		 l= rs4.getInt("total");
		}
		
	%>	
	
	

 <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Dashboard</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
               
                <!-- /.row -->
               
                    <!-- /.col-lg-8 -->

 <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"><%= j %></div>
                                        <div>Users</div>
                                    </div>
                                </div>
                            </div>
                            <a href="userList.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"><%= i %></div>
                                        <div>Books</div>
                                    </div>
                                </div>
                            </div>
                            <a href="bookList.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"><%= k %></div>
                                        <div>Borrowed users</div>
                                    </div>
                                </div>
                            </div>
                            <a href="borrowedUserAdmin.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-support fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"><%= l %></div>
                                        <div>Available books</div>
                                    </div>
                                </div>
                            </div>
                            <a href="availableBookAdmin.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                
                
                   <!-- /.panel-heading -->
                            
 
   <table class="table">
   <thead>
   
    <tr>
    <th>Id</th>
    <th>Title</th>
    <th>Author</th>
    <th>State</th>
    
   </tr>
    
   </thead>
   
   <tbody>
   
   <%
   MyDb db5 = new MyDb();
	Connection con5=null;
	try {
		con5 = db.getCon();
	} catch (URISyntaxException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
   
	
		Statement stmt5 =  con.createStatement();
		ResultSet rs5= stmt5.executeQuery("SELECT * FROM book_table ORDER BY id DESC");
		
		while(rs5.next())
		{
			 %>
			 
			 <tr >
			   <td><%= rs5.getString("id") %> </td>
			   <td><%= rs5.getString("title") %> </td>
			   <td><%= rs5.getString("author") %> </td>
			   <td><%= rs5.getString("state") %> </td>
			   <td> <a href="editBook.jsp?b=<%= rs5.getString("id") %>"> Edit</a> |  </td> 
			   <td> <a href="deleteBook.jsp?b=<%= rs5.getString("id") %>"> Delete | </a>  </td>
			   <td> <a href="detailBook.jsp?b=<%= rs5.getString("id") %>"> Detail </a>  </td>
			 </tr>
			 <%
		}
		
		 %>
		
	
   
  
   
   
   </tbody>
   
 
   
   
 
   </table>
    </div>
 
  
                         
                 
                            <!-- /.panel-footer -->
                       
                
                