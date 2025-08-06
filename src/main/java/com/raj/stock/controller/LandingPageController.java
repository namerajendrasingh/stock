package com.raj.stock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LandingPageController {
@GetMapping("/") 
public String landingPage() {
	 return "landingPage";
 }
}
