package org.khmeracademy.rest.entities.input;

import org.khmeracademy.rest.entities.Restaurants;
import org.khmeracademy.rest.entities.Users;

public class AddComment {

	private int comment_id;
	private String comment;
	private Restaurants rest;
	private Users user;
	
	public Restaurants getRest() {
		return rest;
	}

	public void setRest(Restaurants rest) {
		this.rest = rest;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
}
