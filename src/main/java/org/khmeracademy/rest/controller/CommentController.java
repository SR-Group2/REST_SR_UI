package org.khmeracademy.rest.controller;

import java.util.Map;

import org.khmeracademy.rest.entities.Comments;
import org.khmeracademy.rest.entities.Users;
import org.khmeracademy.rest.entities.input.AddComment;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/rest/comment")
public class CommentController {

	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	//!=========================== Get All Comments ======================================
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getAllComments(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/comment/get-comment", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//!============================ Get Comment By Id ====================================
	@RequestMapping(value="{comment_id}",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getCommentById(@PathVariable int comment_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/comment/"+ comment_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//!============================ Insert the COMMENENT ==================================
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addComment(@RequestBody Comments comments){
		HttpEntity<Object> request = new HttpEntity<Object>(comments,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/comment/insert-comment", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//!============================= Delete Comment ======================================
	@RequestMapping(value="/{comment_id}", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String , Object>> deleteComment(@PathVariable int comment_id){
		HttpEntity<Object> request = new HttpEntity<Object>(comment_id, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/comment/"+ comment_id, HttpMethod.DELETE , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//!============================= Update Comment ======================================
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateComment(@RequestBody AddComment addComment){
		HttpEntity<Object> request = new HttpEntity<Object>(addComment, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/comment", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
}
