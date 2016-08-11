package org.khmeracademy.rest.service;

import org.khmeracademy.rest.entities.User;

public interface UserService {
	
	public User findUserByUsername(String username);
	
}
