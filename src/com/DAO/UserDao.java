package com.DAO;

import java.sql.ResultSet;

public class UserDao {

	// 验证用户是否存在
	public boolean userExits(String user_num) throws Exception {
		String sql = "SELECT * FROM userinfo WHERE user_num = '" + user_num + "' ";

		DBHelper db = new DBHelper();

		ResultSet rs = db.excuteQuery(sql);

		if (rs.next()) {
			return true;
		}

		db.close();
		return false;
	}

	// 根据参数查找用户ID
	public String searchInfo(String user_num, String user_pass, String user_type) throws Exception {
		String sql = "SELECT * FROM userinfo WHERE user_num = '" + user_num + "' AND user_pass = '" + user_pass
				+ "' AND user_type = '" + user_type + "' ";

		DBHelper db = new DBHelper();

		String userid = "";
		ResultSet rs = db.excuteQuery(sql);
		if (rs.next()) {
			userid = rs.getString("user_id");
		}

		return userid;
	}

	// 验证参数并返回布尔值
	public boolean login(String user_num, String user_pass, String user_type) throws Exception {

		String sql = "SELECT * FROM userinfo WHERE user_num = '" + user_num + "' AND user_pass = '" + user_pass
				+ "' AND user_type = '" + user_type + "' ";

		DBHelper db = new DBHelper();

		ResultSet rs = db.excuteQuery(sql);

		if (rs.next()) {
			return true;
		}

		db.close();
		return false;
	}

	//添加用户
	public boolean insertUserInfo(String USER_NAME, String USER_PASS, String USER_NUM, String USER_BIRTHDATE,
			String USER_SEX, String USER_AGE, String USER_EMAIL, String USER_TYPE) throws Exception {
		String sql = "INSERT INTO userinfo(USER_NAME,USER_PASS,USER_NUM,USER_BIRTHDATE,USER_SEX,USER_AGE,USER_EMAIL,USER_TYPE)"
				+ "VALUE ('" + USER_NAME + "','" + USER_PASS + "','" + USER_NUM + "','" + USER_BIRTHDATE + "','"
				+ USER_SEX + "'," + USER_AGE + ",'" + USER_EMAIL + "','" + USER_TYPE + "')";

		DBHelper db = new DBHelper();
		db.executeUpdate(sql);

		return true;
	}

	//查询分数
	public String searchCourse(String user_id) throws Exception {
		String sql = "SELECT * FROM stu_course WHERE user_num='" + user_id + "' ";

		DBHelper db = new DBHelper();

		String userid = "";
		ResultSet rs = db.excuteQuery(sql);
		if (rs.next()) {
			userid = rs.getString("user_id");
		}

		return userid;
	}

	//根据用户ID查询信息
	public ResultSet getUserInfo(String id) throws Exception {

		String sql = "SELECT * FROM userinfo WHERE user_id = '" + id + "' ";

		DBHelper db = new DBHelper();
		ResultSet rs = db.excuteQuery(sql);

		return rs;
	}

	//查询分数（合表）
	public ResultSet getUserScore(String user_id) throws Exception {
		DBHelper db = new DBHelper();

		String sql = "SELECT userinfo.`USER_NAME` AS user_name,userinfo.`USER_NUM` AS user_num,course_name,course_level,stu_grade,stu_grade.`grade_id` as grade_id  "
				+ "FROM userinfo,stu_course,stu_grade " + "WHERE userinfo.`USER_NUM` = stu_grade.`user_num` "
				+ "AND stu_course.`course_id` = stu_grade.`course_id` ";

		String sql1 = "select user_type from userinfo where user_id = '" + user_id + "' ";
		String type = "";
		ResultSet rs1 = db.excuteQuery(sql1);
		if (rs1.next()) {
			type = rs1.getString("user_type");
			if ("C".equals(type)) {
				sql += "AND userinfo.`USER_id` = '" + user_id + "' ";
			}
		}
		
		ResultSet rs = db.excuteQuery(sql);

		return rs;
	}

	//查询ID为3的学生的分数
	public ResultSet getUserScore1(String user_id) throws Exception {

		String sql = "SELECT userinfo.`USER_NAME` AS user_name,userinfo.`USER_NUM` AS user_num,course_name,course_level,stu_grade "
				+ "FROM userinfo,stu_course,stu_grade " + "WHERE userinfo.`USER_NUM` = stu_grade.`user_num` "
				+ "AND stu_course.`course_id` = stu_grade.`course_id` " + "AND userinfo.`USER_id` = '" + 3 + "'  ";

		DBHelper db = new DBHelper();
		ResultSet rs = db.excuteQuery(sql);

		return rs;
	}
	
	//更改用户信息
	public boolean updateUserInfo(String user_name, String user_pass, String user_nickname, String user_title,
			String user_id,String user_date,String user_sex,String user_age,String user_email) throws Exception {

		String sql = "UPDATE userinfo SET USER_NAME='" + user_name + "' ,USER_PASS='" + user_pass + "',USER_NICKNAME='"
				+ user_nickname + "',USER_BIRTHDATE='" + user_date + "',USER_AGE='" + user_age + "',USER_SEX='" + user_sex + "',USER_EMAIL='" + user_email + "' ,USER_TITLE='" + user_title + "' " + "WHERE user_id = '" + user_id + "' ";

		DBHelper db = new DBHelper();
		try {
			db.executeUpdate(sql);
			return true;

		} catch (Exception e) {
			return false;
		}

	}

	//获取用户的身份
	public ResultSet getUserType() throws Exception {

		String sql = " SELECT * FROM user_bs ";

		DBHelper db = new DBHelper();
		ResultSet rs = db.excuteQuery(sql);

		return rs;
	}

	 //添加人员
	public boolean setUserInfo(String USER_NAME, String USER_PASS, String USER_NUM, String USER_SEX, String USER_type)
			throws Exception {
		String sql = "INSERT INTO userinfo(USER_NAME,USER_PASS,USER_NUM,USER_SEX,user_type) " + " VALUE ('" + USER_NAME
				+ "','" + USER_PASS + "','" + USER_NUM + "','" + USER_SEX + "','" + USER_type + "') ";

		DBHelper db = new DBHelper();
		try {
			db.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	//添加课表
	public boolean setCourseInfo(String user_id, String time, String day_1, String day_2, String day_3, String day_4,
			String day_5) throws Exception {
		String sql = "UPDATE Course SET day_1='" + day_1 + "' ,day_2='" + day_2 + "',day_3='" + day_3 + "' ,day_4='"
				+ day_4 + "',day_5='" + day_5 + "' " + "WHERE user_id = '" + user_id + "' AND Time='" + time + "'";

		DBHelper db = new DBHelper();
		try {
			db.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	//更新管理员信息
	public boolean updateSInfo(String user_name, String user_pass, String user_nickname, String user_title,
			String user_id) throws Exception {

		String sql = "UPDATE userinfo SET USER_NAME='" + user_name + "' ,USER_PASS='" + user_pass + "',USER_NICKNAME='"
				+ user_nickname + "' ,USER_TITLE='" + user_title + "' " + "WHERE user_id = '" + user_id + "' ";

		DBHelper db = new DBHelper();
		try {
			db.executeUpdate(sql);
			return true;

		} catch (Exception e) {
			return false;
		}

	}
	
	//获取课表
	public ResultSet getCourse(String user_id) throws Exception {
		String sql = "SELECT * FROM course WHERE user_id= '" + user_id + "' ";

		DBHelper db = new DBHelper();
		ResultSet rs = db.excuteQuery(sql);

		return rs;
	}

	//添加周一的课程
	public boolean setCourseDay1(String user_id, String time, String day_1) throws Exception {
		String sql = "UPDATE Course SET day_1='" + day_1 + "' " + "WHERE user_id = '" + user_id + "' AND Time='" + time
				+ "'";

		DBHelper db = new DBHelper();
		try {
			db.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	//添加周二的课程
	public boolean setCourseDay2(String user_id, String time, String day_2) throws Exception {
		String sql = "UPDATE Course SET day_2='" + day_2 + "' " + "WHERE user_id = '" + user_id + "' AND Time='" + time
				+ "'";

		DBHelper db = new DBHelper();
		try {
			db.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	//添加周三的课程
	public boolean setCourseDay3(String user_id, String time, String day_3) throws Exception {
		String sql = "UPDATE Course SET day_3='" + day_3 + "' " + "WHERE user_id = '" + user_id + "' AND Time='" + time
				+ "'";

		DBHelper db = new DBHelper();
		try {
			db.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	//添加周四的课程
	public boolean setCourseDay4(String user_id, String time, String day_4) throws Exception {
		String sql = "UPDATE Course SET day_4='" + day_4 + "' " + "WHERE user_id = '" + user_id + "' AND Time='" + time
				+ "'";

		DBHelper db = new DBHelper();
		try {
			db.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	//添加周五的课程
	public boolean setCourseDay5(String user_id, String time, String day_5) throws Exception {
		String sql = "UPDATE Course SET day_5='" + day_5 + "' " + "WHERE user_id = '" + user_id + "' AND Time='" + time
				+ "'";

		DBHelper db = new DBHelper();
		try {
			db.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	//删除学生成绩
	public boolean deleteStuGrad(String grade_id) {
		DBHelper db = new DBHelper();

		String sql = "delete from stu_grade where grade_id ='" + grade_id + "'";

		try {
			db.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	//修改学生成绩
	public boolean updateStuGrad(String grade_id, String stu_grade) {

		DBHelper db = new DBHelper();

		String sql = "update stu_grade set stu_grade = '" + stu_grade + "'  WHERE grade_id = '" + grade_id + "'";

		try {
			db.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;

	}
	
	//添加成绩
	 public boolean InsertStuScore(String user_num,String stu_grade,String course_id) throws Exception {
	
	 	String sql = "Insert into stu_grade(user_num,stu_grade,course_id) values('"+user_num+"','"+stu_grade+"','"+course_id+"')";
	 	
		DBHelper db = new DBHelper();
	 	db.executeUpdate(sql);
	 	db.close();
		return true;
	 }
}
