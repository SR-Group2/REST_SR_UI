package org.khmeracademy.rest.controller;

import java.util.Map;

import org.khmeracademy.rest.entities.Restaurants;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/rest/restaurant")
public class RestaurantController {
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getAllRestaurant(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restaurant/get-restaurant", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
//	@RequestMapping(value="{rest_id}",method = RequestMethod.GET)
//	public ResponseEntity<Map<String , Object>> findRestaurantById(@PathVariable int rest_id){
//		HttpEntity<Object> request = new HttpEntity<Object>(header);
//		ResponseEntity<Map> response = rest.exchange(WS_URL+"/rest/"+rest_id, HttpMethod.GET , request , Map.class) ;
//		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
//	}
//	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> insertRestaurant(@RequestBody Restaurants restaurnat){
		restaurnat.toString();
		HttpEntity<Object> request = new HttpEntity<Object>(restaurnat,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/rest/insert-restaurant", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
//	
//	@RequestMapping(value="/{rest_id}", method = RequestMethod.DELETE)
//	public ResponseEntity<Map<String , Object>> deleteUser(@PathVariable int rest_id){
//		HttpEntity<Object> request = new HttpEntity<Object>(rest_id, header);
//		ResponseEntity<Map> response = rest.exchange(WS_URL+"/rest/"+rest_id, HttpMethod.DELETE , request , Map.class) ;
//		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
//	}
//	
//	@RequestMapping(method = RequestMethod.PUT)
//	public ResponseEntity<Map<String , Object>> updateUser(@RequestBody Restaurants restaurant){
//		HttpEntity<Object> request = new HttpEntity<Object>(restaurant, header);
//		ResponseEntity<Map> response = rest.exchange(WS_URL+"/rest/", HttpMethod.PUT , request , Map.class) ;
//		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
//	}
	
	@RequestMapping(value="/{rest_id}",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getUserById(@PathVariable int rest_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restype/"+rest_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody(), HttpStatus.OK);
	}
}
