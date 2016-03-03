package entity;

public class Item {

	public Item() {
		// TODO Auto-generated constructor stub
	}
	

	
	private int id;
	private String brand;
	private String name;
	private String drums;
	private String hardware;
	private String cymbals;
	private String discription;
	private String image;
	private float price;
	
	
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDrums() {
		return drums;
	}
	public void setDrums(String drums) {
		this.drums = drums;
	}
	public String getHardware() {
		return hardware;
	}
	public void setHardware(String hardware) {
		this.hardware = hardware;
	}
	public String getCymbals() {
		return cymbals;
	}
	public void setCymbals(String cymbals) {
		this.cymbals = cymbals;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return this.getId()+this.getName().hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(this==obj){
			return true;
		}
		if(obj instanceof Item){
			Item item=(Item)obj;
			if(item.getId()==this.getId() && item.getName().equals(this.getName())){
				return true;
			}
			else{
				return false;
			}
		}
		else{
			return false;
		}
	}
	
	public static void main(String[] args){
		Item i=new Item();
		float result=i.getPrice();
		
	}

}
