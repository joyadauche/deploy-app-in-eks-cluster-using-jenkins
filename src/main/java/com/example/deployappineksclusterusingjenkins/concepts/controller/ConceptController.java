package com.example.deployappineksclusterusingjenkins.concepts.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ConceptController {
	
	@GetMapping("/")
	public String index () {
		return "Hello from ConceptsController in Spring Boot!";
	}
}
