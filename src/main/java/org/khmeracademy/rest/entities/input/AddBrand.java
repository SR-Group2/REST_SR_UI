package org.khmeracademy.rest.entities.input;

import org.khmeracademy.rest.entities.Addresses;
import org.khmeracademy.rest.entities.Restaurants;

public class AddBrand {

	private String contact;
	private Restaurants rest;
	private Addresses address;
	private String brand_name;
	
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public Restaurants getRest() {
		return rest;
	}
	public void setRest(Restaurants rest) {
		this.rest = rest;
	}
	public Addresses getAddress() {
		return address;
	}
	public void setAddress(Addresses address) {
		this.address = address;
	}
	
}
