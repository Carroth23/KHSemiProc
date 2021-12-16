package dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LikeDAO {
	private static LikeDAO instance = null;
	public static LikeDAO getInstance() {
		if (instance == null) {
			instance = new LikeDAO();
		}
		return instance;
	}
	private LikeDAO() {}
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/orale");
		return ds.getConnection();
	}
	
	// 우선 해당 아이디로 호텔에 좋아요가 되어있는지 확인.
//	public int likeCheck() throws Exception{
//		String sql = "select * from likey where userid = ?";
//	}
	
	
	
}
