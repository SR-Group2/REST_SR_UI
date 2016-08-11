package org.khmeracademy.rest.entities.input;



import java.util.Date;

import org.khmeracademy.rest.entities.Roles;

//import com.fasterxml.jackson.annotation.JsonProperty;

public class AddUser {
	
	private int user_id;
	private String first_name;
	private String last_name;
	private String username;
	private String email;
	private String password;
	private String salt;
	private Date dob;
	private Date joined;
	private String picture;
	private Roles role;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;

	}
	public Date getJoined() {
		return joined;
	}
	public void setJoined(Date joined) {
		this.joined = joined;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Roles getRole() {
		return role;
	}
	public void setRole(Roles role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "AddUser [user_id=" + user_id + ", first_name=" + first_name + ", last_name=" + last_name + ", username="
				+ username + ", email=" + email + ", password=" + password + ", salt=" + salt + ", dob=" + dob
				+ ", joined=" + joined + ", picture=" + picture + ", role=" + role + "]";
	}
	
	
}
