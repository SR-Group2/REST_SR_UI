package org.khmeracademy.rest.entities;

public class FavouriteRestaurants {
	private int favrest_id;
	private int fav_total;
	private Users user;
	private Restaurants rest;
	public int getFavrest_id() {
		return favrest_id;
	}
	public void setFavrest_id(int favrest_id) {
		this.favrest_id = favrest_id;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public Restaurants getRest() {
		return rest;
	}
	public void setRest(Restaurants rest) {
		this.rest = rest;
	}
	public int getFav_total() {
		return fav_total;
	}
	public void setFav_total(int fav_total) {
		this.fav_total = fav_total;
	}
	@Override
	public String toString() {
		return "FavouriteRestaurants [favrest_id=" + favrest_id + ", fav_total=" + fav_total + ", user=" + user
				+ ", rest=" + rest + "]";
	}
	
	
	
}
