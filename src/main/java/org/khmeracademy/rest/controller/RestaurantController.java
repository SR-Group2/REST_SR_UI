package org.khmeracademy.rest.controller;

import java.util.Map;

import org.khmeracademy.rest.entities.RestaurantForm;
import org.khmeracademy.rest.entities.Restaurants;
import org.khmeracademy.rest.entities.input.AddRestaurant;
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
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("/rest/restaurant")
public class RestaurantController {
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	//================== search All Restaurants =================================
	@RequestMapping(value="/search",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> searchRest(
										  @RequestParam(value = "page", required = false , defaultValue="1") int page 
									    , @RequestParam(value="limit" , required = false , defaultValue="4") int limit
									    , @RequestParam(value="keyword" , required = false , defaultValue="") String keyword){
		UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(WS_URL + "/restaurant/search-rest")
									.queryParam("keyword", keyword)
									.queryParam("page", page)
									.queryParam("limit", limit);
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(uri.build().toUriString(), HttpMethod.GET , request , Map.class) ;
		
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	//================== get All Restaurants =================================
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getAllRestaurants(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restaurant/get-restaurant", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	//================== get All Restaurants with PAGINATION =================================
		@RequestMapping(value="/category", method = RequestMethod.GET)
		public ResponseEntity<Map<String , Object>> getRestaurantWithCategory(
				 		@RequestParam(value = "page", required = false , defaultValue="1") int page 
				 		,@RequestParam(value="limit" , required = false , defaultValue="15") int limit
				){
			
			UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(WS_URL+"/restaurant/get-restaurant-with-category")
					.queryParam("page", page)
					.queryParam("limit", limit);
			HttpEntity<Object> request = new HttpEntity<Object>(header);
			ResponseEntity<Map> response = rest.exchange(uri.build().toUriString(), HttpMethod.GET , request , Map.class) ;
			
			return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
//			ResponseEntity<Map> response = rest.exchange(WS_URL+"/restaurant/get-restaurant-with-category", HttpMethod.GET , request , Map.class) ;
			//return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
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
	//================== INSERT To Restaurant =================================
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addRestaurant(@RequestBody RestaurantForm restaurantForm){
		HttpEntity<Object> request = new HttpEntity<Object>(restaurantForm,header);
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
	
	@RequestMapping(value="/total-restaurant", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> countRest(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restaurant/total-restaurant", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
}
