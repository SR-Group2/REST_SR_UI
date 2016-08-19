package org.khmeracademy.rest.controller;

import java.util.Map;

import org.khmeracademy.rest.entities.input.AddBrand;
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
@RequestMapping("/rest/brand")
public class BrandController {
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getAllBrand(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/brand/get-brand", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value = "/{brand_id}",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> findBrandById(@PathVariable int brand_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/brand/"+brand_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> insertBrand(@RequestBody AddBrand addBrand){
		HttpEntity<Object> request = new HttpEntity<Object>(addBrand,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/brand/insert-brand", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value="/{brand_id}", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String , Object>> deleteBrand(@PathVariable int brand_id){
		HttpEntity<Object> request = new HttpEntity<Object>(brand_id, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/brand/"+brand_id, HttpMethod.DELETE , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateBrand(@RequestBody AddBrand addBrand){
		HttpEntity<Object> request = new HttpEntity<Object>(addBrand, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/brand", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}	
}
