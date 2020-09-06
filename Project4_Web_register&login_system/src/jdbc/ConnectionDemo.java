package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionDemo {
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(
					"jdbc:postgresql://localhost:5432/postgres", "postgres", "123456");

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
//		if (connection != null){
//			System.out.println("connect db successful!");
//		}else {
//			System.out.println("Failed to make conn!");
//		}
//		try {
//			Statement  stmt = connection.createStatement();
//			ResultSet rs = stmt.executeQuery("SELECT 1 AS A");
//			if(rs!=null){
//				rs.next();  // 必须添加
//				System.out.println(rs.getInt("a"));
//			}else {
//				System.out.println("null");
//			}
//			rs.close();
//			stmt.close();
//			connection.close();
//		}catch (Exception exp){
//			exp.printStackTrace();
//		}
		
		
		return connection;
	}
	
	public static void close(Connection conn,Statement stmt,ResultSet rs){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
