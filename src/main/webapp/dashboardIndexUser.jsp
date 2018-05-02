<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="servlet.MyDb"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.net.URISyntaxException" %>



<div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Book List</h1>
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
    <th>Title</th>
    <th>Author</th>
    <th>State</th>
    
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
		ResultSet rs= stmt.executeQuery("SELECT * FROM book_table ORDER BY id DESC");
		
		while(rs.next())
		{
			 %>
			 
			 <tr >
			   <td><%= rs.getString("id") %> </td>
			   <td><%= rs.getString("title") %> </td>
			   <td><%= rs.getString("author") %> </td>
			   
			   
			   <td><%= rs.getString("state") %> </td>
			   
			    <%
			 String x = rs.getString("state");
			    char c = x.charAt(0);
			    if(c =='f')
			    {
			    %>
			   <td> <a href="detailBookUser.jsp?du=<%= rs.getString("id") %>"> Detail </a> </td> 
			  <%
			    }
			    
			    else{
			  %>
			    <td> <a href="detailBookUser.jsp?du=<%= rs.getString("id") %>"> Borrow  </a> </td> 
			<%
			    }
			%>
			  
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
       