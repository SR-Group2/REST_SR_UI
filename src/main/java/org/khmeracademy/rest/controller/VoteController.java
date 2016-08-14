package org.khmeracademy.rest.controller;

import java.util.Map;

import org.khmeracademy.rest.entities.Votes;
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
@RequestMapping("/rest/vote")
public class VoteController {

	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getVotes(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/vote/get-vote", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value="/{vote_id}",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getVoteById(@PathVariable int vote_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/vote/"+vote_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addVote(@RequestBody Votes vote){
		HttpEntity<Object> request = new HttpEntity<Object>(vote,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/vote/insert-vote", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	@RequestMapping(value="/{vote_id}", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String , Object>> deleteVote(@PathVariable int vote_id){
		HttpEntity<Object> request = new HttpEntity<Object>(vote_id, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/vote/"+vote_id, HttpMethod.DELETE , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
}
