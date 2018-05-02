package servlet;




import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Main
 */
@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Main() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
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
		try {
		Statement stmt =  con.createStatement();
		stmt.executeUpdate("INSERT INTO user_table (uname,upass,email)VALUES('"+name+"','"+pass+"','"+email+"')");
		
		response.sendRedirect("registrationSuccess.jsp");
		
		response.getOutputStream().print("<html><head><script type='text/javascript'>function Success() { alert('Registration Success. Please log On'); }</script></head><body onload='Success()'></body></html>");
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			//request.getRequestDispatcher("registrationError.jsp").forward(request, response);
		}
		// TODO Auto-generated method stub
	}

}
