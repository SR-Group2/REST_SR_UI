package org.khmeracademy.rest.controller;

import java.util.Map;

import org.khmeracademy.rest.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/rest/user")
public class UserController {

	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	//==================== Get User Owner ===============
	@RequestMapping(value="/owner", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getUserOwner(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/user/get-user-owner", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getUser(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/user/get-user", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value="{user_id}",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getUserById(@PathVariable int user_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/user/"+user_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> adduser(@RequestBody Users users){
		HttpEntity<Object> request = new HttpEntity<Object>(users,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/user/insert-user", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/sign-up", method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> signUp(@RequestBody Users user){
		System.out.println("UI");
		HttpEntity<Object> request = new HttpEntity<Object>(user,header);
		System.out.println(WS_URL);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/user/sign-up", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value="/img", method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getImages(@RequestBody Users users){
		HttpEntity<Object> request = new HttpEntity<Object>(users,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/user/insert-user", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value="/{user_id}", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String , Object>> deleteUser(@PathVariable int user_id){
		HttpEntity<Object> request = new HttpEntity<Object>(user_id, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/user/"+user_id, HttpMethod.DELETE , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateUser(@RequestBody Users user){
		System.out.println(user);
		
		HttpEntity<Object> request = new HttpEntity<Object>(user, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/user/", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value="count-by-role-id/{role_id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> countUser(@PathVariable("role_id") int role_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/user/count-by-role-id/"+role_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	
}
