package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import entity.Item;
import entity.User;
import util.DBHelper;

public class ItemDao {

	public ItemDao() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	public ArrayList<Item> getAllItems(){
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<Item> items=new ArrayList<Item>();
		
		try {
			conn=DBHelper.getConnection();
			String sql="select * from items";
			stmt=conn.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){
				Item item=new Item();
				item.setId(rs.getInt("id"));
				item.setBrand(rs.getString("brand"));
				item.setName(rs.getString("name"));
				item.setDrums(rs.getString("drums"));
				item.setHardware(rs.getString("hardware"));
				item.setCymbals(rs.getString("cymbals"));
				item.setDiscription(rs.getString("discription"));
				item.setImage(rs.getString("image"));
				item.setPrice(rs.getFloat("price"));
				items.add(item);
			}
			return items;
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
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
	
	
	public Item getItemById(int id){
		Item item=new Item();
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			conn=DBHelper.getConnection();
			String sql="select * from items where id=?";
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs=stmt.executeQuery();
			if(rs.next()){
				item.setId(rs.getInt("id"));
				item.setBrand(rs.getString("brand"));
				item.setName(rs.getString("name"));
				item.setDrums(rs.getString("drums"));
				item.setHardware(rs.getString("hardware"));
				item.setCymbals(rs.getString("cymbals"));
				item.setDiscription(rs.getString("discription"));
				item.setImage(rs.getString("image"));
				item.setPrice(rs.getFloat("price"));
				return item;
			}
			else{
				return null;
			}
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally{
			if(rs!=null){
				try {
					rs.close();
					rs=null;
				} catch (Exception e) {
					// TODO Auto-generated catch block
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
	
//	public static void main(String[] args){
//		ItemDao a=new ItemDao();
//		ArrayList<Item> items=a.getAllItems();
//		System.out.println(items.size());
//		for(Item i:items){
//		System.out.println(i.getId());
//		}
//	}
	
}
