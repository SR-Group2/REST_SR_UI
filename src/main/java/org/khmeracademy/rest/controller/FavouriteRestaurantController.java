package org.khmeracademy.rest.controller;

import java.util.Map;

import org.khmeracademy.rest.entities.FavouriteRestaurants;
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
@RequestMapping("/rest/favourite-restaurant")
public class FavouriteRestaurantController {
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getFavRestaurant(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/favourite-restaurant/get-fav-restaurant", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value="/{favrest_id}",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getFavRestaurant(@PathVariable int favrest_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/favourite-restaurant/"+favrest_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addFavRestaurant(@RequestBody FavouriteRestaurants favRestaurant){
		HttpEntity<Object> request = new HttpEntity<Object>(favRestaurant,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/favourite-restaurant/insert-fav-restaurnt", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value="get-fav-rest-by-user-id/{user_id}",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getFavouriteRestaurantByUserId(@PathVariable("user_id") int user_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/favourite-restaurant/get-fav-rest-by-user-id/"+user_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value="/is-fav-existed/{user_id}/{rest_id}",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> isFavExisted(@PathVariable("user_id") int user_id, @PathVariable("rest_id") int rest_id ){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/favourite-restaurant/is-fav-existed/"+user_id+"/"+rest_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
}
