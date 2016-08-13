package org.khmeracademy.rest.controller;

import java.util.Map;

import org.khmeracademy.rest.entities.Categories;
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
@RequestMapping("/rest/category")

public class CategoryController {

		@Autowired
		private HttpHeaders header;
		
		@Autowired
		private RestTemplate rest;
		
		@Autowired
		private String WS_URL;
		
		
		@RequestMapping(method = RequestMethod.GET)
		public ResponseEntity<Map<String , Object>> getCategory(){
			HttpEntity<Object> request = new HttpEntity<Object>(header);
			ResponseEntity<Map> response = rest.exchange(WS_URL+"/category/get-category", HttpMethod.GET , request , Map.class) ;
			return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
		}
		
		@RequestMapping(value="/{category_id}",method = RequestMethod.GET)
		public ResponseEntity<Map<String , Object>> getCategoryById(@PathVariable int category_id){
			HttpEntity<Object> request = new HttpEntity<Object>(header);
			ResponseEntity<Map> response = rest.exchange(WS_URL+"/category/"+category_id, HttpMethod.GET , request , Map.class) ;
			return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
		}
		
		@RequestMapping(method = RequestMethod.POST)
		public ResponseEntity<Map<String , Object>> addCategory(@RequestBody Categories category){
			HttpEntity<Object> request = new HttpEntity<Object>(category,header);
			ResponseEntity<Map> response = rest.exchange(WS_URL+"/category/insert-category", HttpMethod.POST , request , Map.class) ;
			return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
		}
		
		@RequestMapping(value="/{category_id}", method = RequestMethod.DELETE)
		public ResponseEntity<Map<String , Object>> deleteCategory(@PathVariable int category_id){
			HttpEntity<Object> request = new HttpEntity<Object>(category_id, header);
			ResponseEntity<Map> response = rest.exchange(WS_URL+"/category/delete-category/"+category_id, HttpMethod.DELETE , request , Map.class) ;
			return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
		}
	
		@RequestMapping(method = RequestMethod.PUT)
		public ResponseEntity<Map<String , Object>> updateCategory(@RequestBody Categories category){
			HttpEntity<Object> request = new HttpEntity<Object>(category, header);
			ResponseEntity<Map> response = rest.exchange(WS_URL+"/category", HttpMethod.PUT , request , Map.class) ;
			return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
		}
		
		//======================== GET CATEGORY BY RESTAURANT ID ==========================
		@RequestMapping(value="/catrest/{rest_id}",method = RequestMethod.GET)
		public ResponseEntity<Map<String , Object>> getCateogryById(@PathVariable int rest_id){
			HttpEntity<Object> request = new HttpEntity<Object>(header);
			ResponseEntity<Map> response = rest.exchange(WS_URL+"/category/get-category-by-rest-id/"+rest_id, HttpMethod.GET , request , Map.class) ;
			return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
		}
		
	}
