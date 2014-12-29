package shared;

import java.sql.*;

public class JDBCUtil implements JDBCConstants{
	
	Connection  conn ;
		
	public Connection makeConnection() throws Exception{
	    // do not make conn an instance variable
		// making it an instance variable may cause "out of connection" error
		try{      
//			DriverManager.registerDriver(new AppEngineDriver());
//			conn = DriverManager.getConnection(URL);
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			return conn;
		} // try
		catch (Exception e) {
			throw e;
		} // catch
	} // makeConnection
	
	public void closeConn () throws SQLException{
	conn.close();
	}
}
