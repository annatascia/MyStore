package dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entity.User;
import util.DBHelper;

public class UserDao {

	public UserDao() {
		// TODO Auto-generated constructor stub
	}

	public boolean addUser(User user){
		Connection conn=null;
		PreparedStatement stmt=null;
		
		try {
			conn=DBHelper.getConnection();
			String sql="" +
					"insert into users" +
					"(username,password,birthday,gender)" +
					"values(" +
					"?,?,?,?)";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getPassword());
			stmt.setDate(3,new Date(user.getBirthday().getTime()));
			stmt.setString(4,user.getGender());
			stmt.execute();
			return true;
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally{
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		
	}
	
	public User getUserByUsername(String username){
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		User user=new User();
		
		try {
			conn=DBHelper.getConnection();
			String sql="select * from users where username=?";
			
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, username);
			rs=stmt.executeQuery();
			if(rs.next()){
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setBirthday(rs.getDate("birthday"));
				user.setGender(rs.getString("gender"));
				
				return user;
				
			}else{
				return null;
			}
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
	}
}
