package org.khmeracademy.rest.controller;

import java.util.Map;

import org.khmeracademy.rest.entities.input.AddBrand;
import org.khmeracademy.rest.entities.input.AddRestype;
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
@RequestMapping("/rest/restype")
public class RestypeController {
	
	
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
//	//====================== Get All Restypes ======================
//	@RequestMapping(method = RequestMethod.GET)
//	public ResponseEntity<Map<String , Object>> getAllRestypes(){
//		HttpEntity<Object> request = new HttpEntity<Object>(header);
//		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restype/get-restype", HttpMethod.GET , request , Map.class) ;
//		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
//	}
	
	//===================== Get Restype By Id =====================
	@RequestMapping(value="/{restype_id}",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getRestype(@PathVariable("restype_id") int restype_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restype/"+restype_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//===================== Get Restype Only By Id =====================
		@RequestMapping(value="/only/{restype_id}",method = RequestMethod.GET)
		public ResponseEntity<Map<String , Object>> getOnlyRestype(@PathVariable("restype_id") int restype_id){
			HttpEntity<Object> request = new HttpEntity<Object>(header);
			ResponseEntity<Map> response = rest.exchange(WS_URL+"/restype/only/"+restype_id, HttpMethod.GET , request , Map.class) ;
			return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
		}
	//===================== Restype Pagination =====================
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
		ResponseEntity<Map> response = rest.exchange(uri.build().toUriString(), HttpMethod.GET , request , Map.class) ;
		
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	//===================== Insert Restaurant type =====================
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> insertRestype(@RequestBody AddRestype addRestype){
		HttpEntity<Object> request = new HttpEntity<Object>(addRestype,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restype/insert-restype", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	//===================== Delete Restaurant type =====================
	@RequestMapping(value="/{restype_id}", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String , Object>> deleteRestype(@PathVariable int restype_id){
		HttpEntity<Object> request = new HttpEntity<Object>(restype_id, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restype/"+restype_id, HttpMethod.DELETE , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	//===================== Update Restaurant type =====================
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateBrand(@RequestBody AddRestype addRestype){
		HttpEntity<Object> request = new HttpEntity<Object>(addRestype, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/restype/", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}	
}
