package servlet;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MyDb {

	
	public Connection con;
	public Connection getCon() throws URISyntaxException, SQLException {
	    URI dbUri = new URI(System.getenv("DATABASE_URL"));

	    String username = dbUri.getUserInfo().split(":")[0];
	    String password = dbUri.getUserInfo().split(":")[1];
	    String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath() + "?sslmode=require";

	    con= DriverManager.getConnection(dbUrl, username, password);
	    return con;
	}
	
	
	
	// we gonna check for connection 
	
	//public static void main(String[] args) throws ClassNotFoundException, SQLException {
	//getPreparedStatement("select * from user");
	//}
	
}
