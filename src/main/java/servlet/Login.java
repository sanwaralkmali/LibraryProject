package servlet;


import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//PrintWriter out = response.getWriter();
		String name = request.getParameter("email");
		String pass = request.getParameter("upass");
		MyDb db = new MyDb();
		Connection con=null;
		try {
			
			con = db.getCon();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				try {
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM user_table WHERE email = '"+name+"' AND upass ='"+pass+"'");
		
		if(rs.next()){
			
			if((name.equals("angeflorent@hotmail.fr") && pass.equals("lapillule")) || (name.equals("oumou@hotmail.fr") && pass.equals("oumouproject")) )
			{
				HttpSession session = request.getSession();
				session.setAttribute("admin",rs.getString("uname"));
				Cookie cookie = new Cookie("admin",rs.getString("uname"));
				cookie.setMaxAge(5*60);
				response.addCookie(cookie);
				response.sendRedirect("dashboard.jsp");
			}
		
			else {
				HttpSession session = request.getSession();
				session.setAttribute("user",rs.getString("uname"));
				Cookie cookie = new Cookie("user",rs.getString("uname"));
				cookie.setMaxAge(5*60);
				response.addCookie(cookie);
				response.sendRedirect("DashboardUser.jsp");
			}
		}
		else {
			request.getRequestDispatcher("loginError.jsp").forward(request, response);
		}
		
		} catch (SQLException ex) {
			System.out.println("error ");
		Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

}
