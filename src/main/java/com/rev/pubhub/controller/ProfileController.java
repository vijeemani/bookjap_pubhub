package com.rev.pubhub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rev.pubhub.service.UserService;

@Controller
@RequestMapping("/profile")
public class ProfileController {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/profileopen")
	public String userProfile(){
		return "userprofile/profile";
	}

}
