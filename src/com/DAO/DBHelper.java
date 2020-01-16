package com.DAO;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.spi.DirectoryManager;

public class DBHelper {
	private Connection connection = null;
	private ResultSet rs = null;
	private Statement statement = null;
	
	//设置数据库链接
	private static final String url = "jdbc:mysql://localhost:3306/jwglxt?useUnicode=true&characterEncoding=utf8";
	
	
	static {
		try {
			//添加数据库驱动
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 执行增删改方法
	 * @param 只能执行insert update delete
	 * @throws Exception
	 * */
	private void getConnection() throws SQLException{
		connection = DriverManager.getConnection(url,"root","");
	}
	
	/**
	 * 执行查询数据的方法
	 * @param 执行select语句
	 * @throws Exception
	 * @return 返回结果集
	 * */
	public void executeUpdate(String sql) throws Exception {
		getConnection();
		Statement statement = connection.createStatement();
		statement.executeUpdate(sql);
	}
	
	/**
	 * 关闭数据库链接释放资源
	 * @throws SQLException
	 * */
	public ResultSet excuteQuery(String sql) throws Exception{
		
		getConnection();
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		
		return rs;
	}

	public void close() throws SQLException {
		if(rs != null) {
			rs.close();
			rs = null;
		}
		if(statement != null) {
			statement.close();
			statement = null;
		}
		if(connection != null) {
			connection.close();
			connection = null;
		}
	}
	
	
}
