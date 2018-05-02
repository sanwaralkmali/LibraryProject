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
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Cookie exCookie = null;
		    Cookie[] cookies = request.getCookies();
		    HttpSession session = request.getSession(false);
		    if(session != null) {
		    	session.removeAttribute("admin");
		    	session.invalidate();
		    }
		    if(cookies != null){
		    	for(Cookie cookie : cookies){
		    		if(cookie.getName().equals("admin"))
		    		exCookie = cookie;
		    		if(cookie.getName().equals("JSESSIONID"))
		    			System.out.println(cookie.getValue());
		    	}
		    }
		    
		    if(exCookie != null)
		    {
		    	exCookie.setMaxAge(0);
		    	response.addCookie(exCookie);
		    	
		    	
		    }
		    
		    response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//PrintWriter out = response.getWriter();
		
	}

}
