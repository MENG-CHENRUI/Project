package jdbc;

import java.sql.Connection;

public class ConnectionTest {
	public static void main(String[] args) {
		Connection conn=ConnectionDemo.getConnection();
		System.out.println(conn);
	}
}
