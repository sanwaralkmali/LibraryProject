package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddNewUser
 */
@WebServlet("/Borrowbook")
public class Borrowbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Borrowbook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id_user = request.getParameter("userId");
		String id= request.getParameter("id");
		int id_book = Integer.parseInt(id);
		DateFormat dateFormat = new SimpleDateFormat("yyyymmdd");
		Date date = new Date();
		String dates= dateFormat.format(date);
		
		MyDb db = new MyDb();
		Connection con=null;
		try {
			con = db.getCon();
		} catch (URISyntaxException e1) {
			// TODO Auto-generated catch block
			PrintWriter out = response.getWriter();
			out.println(e1.getMessage() + "   " + e1.getCause());
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			PrintWriter out = response.getWriter();
			out.println(e1.getMessage() + "   " + e1.getCause());
		}
		try {
		Statement stmt =  con.createStatement();
		stmt.executeUpdate("INSERT INTO borrow_table(user_id,book_id,my_date)VALUES((SELECT uid FROM user_table WHERE uname='"+id_user+"'),"+id_book+",'"+dates+"')");
		stmt.executeUpdate("UPDATE book_table SET state=FALSE WHERE id ="+id_book+"");
		
		response.sendRedirect("DashboardUser.jsp");
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
				//request.getRequestDispatcher("registrationError.jsp").forward(request, response);		
			PrintWriter out = response.getWriter();
			out.println(e.getMessage() + "   " + e.getErrorCode());
			}
		
	     }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		String id_user = request.getParameter("userId");
		String id= request.getParameter("id");
		int id_book = Integer.parseInt(id);
		DateFormat dateFormat = new SimpleDateFormat("yyyymmdd");
		Date date = new Date();
		String dates= dateFormat.format(date);
		
		MyDb db = new MyDb();
		Connection con=null;
		try {
			con = db.getCon();
		} catch (URISyntaxException e1) {
			// TODO Auto-generated catch block
			PrintWriter out = response.getWriter();
			out.println(e1.getMessage() + "   " + e1.getCause());
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			PrintWriter out = response.getWriter();
			out.println(e1.getMessage() + "   " + e1.getCause());
		}
		try {
		Statement stmt =  con.createStatement();
		stmt.executeUpdate("INSERT INTO borrow_table(user_id,book_id,my_date)VALUES((SELECT uid FROM user_table WHERE uname='"+id_user+"'),"+id_book+",'"+dates+"')");
		stmt.executeUpdate("UPDATE book_table SET state=FALSE WHERE id ="+id_book+"");
		
		response.sendRedirect("DashboardUser.jsp");
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
				//request.getRequestDispatcher("registrationError.jsp").forward(request, response);		
			PrintWriter out = response.getWriter();
			out.println(e.getMessage() + "   " + e.getErrorCode());
			}
		
	     }

}
