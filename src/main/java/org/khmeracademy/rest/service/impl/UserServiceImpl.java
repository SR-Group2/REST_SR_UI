package org.khmeracademy.rest.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.khmeracademy.rest.entities.Role;
import org.khmeracademy.rest.entities.User;
import org.khmeracademy.rest.entities.input.UserLogin;
import org.khmeracademy.rest.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;



@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	@Override
	public User findUserByUsername(String username) {
		
		System.out.println(username);
		
		UserLogin login = new UserLogin();
		
		login.setUsername(username);
		HttpEntity<Object> request = new HttpEntity<Object>(login,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/user/find-user-by-username", HttpMethod.POST , request , Map.class) ;
		Map<String, Object> map = (HashMap<String, Object>)response.getBody();
		System.out.println(map);
		if(map.get("DATA") != null){
			Map<String , Object> data = (HashMap<String , Object>) map.get("DATA");
			User u = new User();
			u.setId((Integer)data.get("ID"));
			u.setEmail((String)data.get("EMAIL"));
			u.setUsername((String)data.get("USERNAME"));
			u.setPassword((String) data.get("PASSWORD"));
			
			List<Role> roles = new ArrayList<Role>();
			List<HashMap<String, Object>> dataRole = (List<HashMap<String, Object>>) data.get("roles");
			for (Map<String , Object> datas  : dataRole) {
				Role role = new Role();
				role.setId((Integer)datas.get("ID"));
				role.setName((String) datas.get("NAME"));
				roles.add(role);
			}
			System.out.println(dataRole);
			u.setRoles(roles);
			
			System.out.println(map);
			return u;
		}
		return null;
	}

	

}
