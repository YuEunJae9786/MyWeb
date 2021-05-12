package com.myweb.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class JdbcUtil {

	static public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		// close작업
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e) {
			System.out.println("close작업 예외!");
		}
	}
	
}
