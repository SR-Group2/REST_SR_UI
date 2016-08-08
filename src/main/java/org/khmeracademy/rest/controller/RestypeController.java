package org.khmeracademy.rest.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("/rest/restype")
public class RestypeController {
	
	
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
//	@RequestMapping(method = RequestMethod.GET)
//	public ResponseEntity<Map<String , Object>> getRestype(){
//		HttpEntity<Object> request = new HttpEntity<Object>(header);
//		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restype/get-restype", HttpMethod.GET , request , Map.class) ;
//		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
//	}
//	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getRestype(
										  @RequestParam(value = "page", required = false , defaultValue="1") int page 
									    , @RequestParam(value="limit" , required = false , defaultValue="4") int limit
									    , @RequestParam(value="keyword" , required = false , defaultValue="") String keyword){
		UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(WS_URL + "/restype/get-restype")
									.queryParam("keyword", keyword)
									.queryParam("page", page)
									.queryParam("limit", limit);
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		//ResponseEntity<Map> response = rest.exchange(WS_URL + "/restype/get-restype?keyword="+keyword+"page="+page+"&limit="+limit, HttpMethod.GET , request , Map.class) ;
		ResponseEntity<Map> response = rest.exchange(uri.build().toUriString(), HttpMethod.GET , request , Map.class) ;
		
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
}
