package org.khmeracademy.rest.controller;

import java.util.Map;


import org.khmeracademy.rest.entities.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@RestController
@RequestMapping("/rest/upload")
public class UploadController {
	

	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	//!============================ Upload Comment To Server ==================================
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> addImage(@RequestParam("image") CommonsMultipartFile file){
		System.out.println("Hello");
		HttpEntity<Object> request= new HttpEntity<Object>(file,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/api/upload", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String,Object>>(response.getBody(), HttpStatus.OK);
	}
	
}
