package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import entity.Cart;
import entity.Item;
import entity.User;
import entity.UserItems;
import util.DBHelper;

public class UserItemsDao {

	public UserItemsDao() {
		// TODO Auto-generated constructor stub
	}
	
	public ArrayList<UserItems> getItems(int userId){
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<UserItems> userItemsList=new ArrayList<UserItems>();
		
		try {
			conn=DBHelper.getConnection();
			
				
			String sql="select * from items_bought where userId=?";
			
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, userId);
			rs=stmt.executeQuery();
			while(rs.next()){
				UserItems userItems=new UserItems();
				userItems.setId(rs.getInt("id"));
				userItems.setItemId(rs.getInt("itemId"));
				userItems.setUserId(rs.getInt("userId"));
				userItems.setAmount(rs.getInt("amount"));
				userItems.setBuyDate(rs.getDate("buyDate"));
				userItemsList.add(userItems);
			}
			return userItemsList;
			
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			
		}finally{
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(stmt!=null){
				try {
					stmt.close();
					stmt=null;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	
	public boolean addOneRecord(User user,Cart cart){
		
		Connection conn=null;
		PreparedStatement stmt=null;
		String sql;
		Item i=null;
		
		try {
			conn=DBHelper.getConnection();
			
			//添加商品和时间信息
			HashMap<Item,Integer> itemsInfo=cart.getItemsInCart();
			Set<Item> items=itemsInfo.keySet();
			Iterator it=items.iterator();
			Date now=new Date(System.currentTimeMillis());
			while(it.hasNext()){
				i=(Item)it.next();
				
				sql="" +
						"insert into items_bought" +
						"(userId,itemId,amount,buyDate)" +
						"values(" +
						"?,?,?,?)";
			
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, user.getId());
			stmt.setInt(2, i.getId());
			stmt.setInt(3, itemsInfo.get(i));
			stmt.setDate(4, now);
			stmt.execute();
			return true;
			}
			return false;
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally{
			
			if(stmt!=null){
				try {
					stmt.close();
					stmt=null;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
	}
	
//	public static void main(String[] args){
//		UserItemsDao userItemsDao= new UserItemsDao();
//		ItemDao itemDao=new ItemDao();
//		ArrayList<UserItems> userItemsList=userItemsDao.getItems(4);
//		System.out.println(userItemsList);
//		if(userItemsList!=null){
//			System.out.println("******");
//			for(UserItems temp:userItemsList){
//				System.out.println(temp.getUserId());
//				
//			}
//		}
//		
//	}
	
	

}
