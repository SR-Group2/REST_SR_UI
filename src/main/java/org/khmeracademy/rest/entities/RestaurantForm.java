package org.khmeracademy.rest.entities;

import java.util.List;

import org.khmeracademy.rest.entities.Addresses;
import org.khmeracademy.rest.entities.Categories;
import org.khmeracademy.rest.entities.input.RestTypeId;

public class RestaurantForm {

	// 1. Insert address -> return address id (table name : addresses)
	private Addresses address; 
	
	// 2. Insert Restaurant -> return rest_id (table name : restaurants)
	private String rest_name_kh;
	private String rest_name;
	private String location;
	private String about;
	private String contact;
	private int user_id;
	private int rest_id;
	private String open_close;
	
	//3. Insert Many Categories -> return category ID (table name : categories)
	private List<Categories> categories;
	
	//4. Insert Many Categories ID and Restaurants ID ( table name : catrests ) 
	//private List<Integer> categories_id;
	
	// 5. Get ID from table name restypes( Get from client ) 
	//    - > Insert only 3 Menus Id and Restaurants ID  ( table name : menus ) 
	private List<RestTypeId> restypes_id;

	public Addresses getAddress() {
		return address;
	}

	public void setAddress(Addresses address) {
		this.address = address;
	}

	public String getRest_name_kh() {
		return rest_name_kh;
	}

	public void setRest_name_kh(String rest_name_kh) {
		this.rest_name_kh = rest_name_kh;
	}

	public String getRest_name() {
		return rest_name;
	}

	public void setRest_name(String rest_name) {
		this.rest_name = rest_name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public List<Categories> getCategories() {
		return categories;
	}

	public void setCategories(List<Categories> categories) {
		this.categories = categories;
	}

	

	/*public List<Integer> getCategories_id() {
		return categories_id;
	}

	public void setCategories_id(List<Integer> categories_id) {
		this.categories_id = categories_id;
	}*/



	public int getRest_id() {
		return rest_id;
	}

	public void setRest_id(int rest_id) {
		this.rest_id = rest_id;
	}

	public List<RestTypeId> getRestypes_id() {
		return restypes_id;
	}

	public void setRestypes_id(List<RestTypeId> restypes_id) {
		this.restypes_id = restypes_id;
	}

	public String getOpen_close() {
		return open_close;
	}

	public void setOpen_close(String open_close) {
		this.open_close = open_close;
	}

	
	
	
	
	
	
	
}
