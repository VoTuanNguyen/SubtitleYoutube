package getsubyoutube.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnUtils {
	public static Connection getMySQLConnection()
	         throws ClassNotFoundException, SQLException {
	     String hostName = "localhost";
	     String dbName = "getsubyoutube";
	     String userName = "root";
	     String password = "";
	     return getMySQLConnection(hostName, dbName, userName, password);
	 }
	  
	 public static Connection getMySQLConnection(String hostName, String dbName,
	         String userName, String password) throws SQLException,
	         ClassNotFoundException {
	    
	     Class.forName("com.mysql.jdbc.Driver");
	     String tv = "?useUnicode=true&characterEncoding=utf-8";
	     String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName + tv ;
	  
	     Connection conn = DriverManager.getConnection(connectionURL, userName,
	             password);
	     return conn;
	 }
}