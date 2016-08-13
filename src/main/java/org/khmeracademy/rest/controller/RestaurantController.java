package org.khmeracademy.rest.controller;

import java.util.Map;

import org.khmeracademy.rest.entities.Restaurants;
import org.khmeracademy.rest.entities.Users;
import org.khmeracademy.rest.entities.input.AddRestaurant;
import org.khmeracademy.rest.entities.input.AddUser;
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
@RequestMapping("/rest/restaurant")
public class RestaurantController {
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	//================== get All Restaurants =================================
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getAllRestaurants(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restaurant/get-restaurant", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//================== GET RESTAURANT BY ID =========================================
	@RequestMapping(value="/{rest_id}",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getRestaurantById(@PathVariable int rest_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restaurant/"+rest_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//================== Get Restaurant By Restye ID Pagination ==========
		@RequestMapping(value="/list/{rest_id}",method = RequestMethod.GET)
		public ResponseEntity<Map<String , Object>> getRestaurantByRestype(@PathVariable int rest_id,
				@RequestParam(value = "page", required = false , defaultValue="1") int page,
				@RequestParam(value="limit" , required = false , defaultValue="15") int limit){
			HttpEntity<Object> request = new HttpEntity<Object>(header);
			ResponseEntity<Map> response = rest.exchange(WS_URL+"/restype/"+rest_id+"?page="+page+"&limit="+limit,
					HttpMethod.GET , request , Map.class) ;
			return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
		}
	//================== Add To Restaurant =================================
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addRestaurant(@RequestBody Restaurants restaurants){
		HttpEntity<Object> request = new HttpEntity<Object>(restaurants,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restaurant/insert-restaurant", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	//================== Delete Restaurant =================================
	@RequestMapping(value="/{rest_id}", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String , Object>> deleteRestaurant(@PathVariable int rest_id){
		HttpEntity<Object> request = new HttpEntity<Object>(rest_id, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restaurant/"+rest_id, HttpMethod.DELETE , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	//==================Update  Restaurant =================================
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateRestaurant(@RequestBody AddRestaurant addRestaurant){
		HttpEntity<Object> request = new HttpEntity<Object>(addRestaurant, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restaurant", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}

	
}
