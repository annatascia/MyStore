package entity;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class Cart {

	HashMap<Item,Integer> itemsInCart=new HashMap<Item,Integer>();
	private double totalPrice;
	
	public Cart() {
		// TODO Auto-generated constructor stub
		itemsInCart = new HashMap<Item,Integer>();
		totalPrice = 0.0;
	}
	
	public boolean addToCart(Item item){
		System.out.println(item.getName());
		if(itemsInCart.containsKey(item)){
			itemsInCart.put(item, 1+itemsInCart.get(item));
			
		}
		else{
			itemsInCart.put(item, 1);
			
		}
		calculateTotalPrice();
		return true;
	}
	
	public boolean deleteFromCart(Item item){
		itemsInCart.remove(item);
		calculateTotalPrice(); 
		return true;
	}
	
	public HashMap<Item, Integer> getItemsInCart() {
		return itemsInCart;
	}

	public void setItemsInCart(HashMap<Item, Integer> itemsInCart) {
		this.itemsInCart = itemsInCart;
	}

	public void calculateTotalPrice(){
		double sum=0;
		Set<Item> items=itemsInCart.keySet();
		Iterator<Item> it=items.iterator();
		while(it.hasNext()){
			Item item=it.next();
			sum+=itemsInCart.get(item)*item.getPrice();
		}
		this.setTotalPrice(sum);
	}

	

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
	

}
