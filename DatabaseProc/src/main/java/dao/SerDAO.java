package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.SerDTO;

public class SerDAO {
	private static SerDAO instance = null;
	public static SerDAO getInstance() {
		if (instance == null) {
			instance = new SerDAO();
		}
		return instance;
	}
	private SerDAO () {}
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public SerDTO selectAll() throws Exception{
		String sql = "select * from wow";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()){
			SerDTO dto = new SerDTO();
			rs.next();
			dto.setNum(rs.getInt("ser"));
			dto.setName(rs.getString("name"));
			return dto;
		}
	}
	
	public int insert() throws Exception{
		String sql = "insert into wow values(20, '넣음')";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			con.commit();
			return pstat.executeUpdate();
			
		}
	}
}
