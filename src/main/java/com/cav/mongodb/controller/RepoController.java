package com.cav.mongodb.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RepoController {
	


	@GetMapping("/status")
	public String homePage() {
		return "UP";
	}
	
}
