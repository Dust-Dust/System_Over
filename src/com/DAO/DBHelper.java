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
	
	//�������ݿ�����
	private static final String url = "jdbc:mysql://localhost:3306/jwglxt?useUnicode=true&characterEncoding=utf8";
	
	
	static {
		try {
			//������ݿ�����
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * ִ����ɾ�ķ���
	 * @param ֻ��ִ��insert update delete
	 * @throws Exception
	 * */
	private void getConnection() throws SQLException{
		connection = DriverManager.getConnection(url,"root","");
	}
	
	/**
	 * ִ�в�ѯ���ݵķ���
	 * @param ִ��select���
	 * @throws Exception
	 * @return ���ؽ����
	 * */
	public void executeUpdate(String sql) throws Exception {
		getConnection();
		Statement statement = connection.createStatement();
		statement.executeUpdate(sql);
	}
	
	/**
	 * �ر����ݿ������ͷ���Դ
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
