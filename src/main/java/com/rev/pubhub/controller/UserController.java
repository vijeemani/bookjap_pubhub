package com.rev.pubhub.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rev.pubhub.form.RegistrationValidation;
import com.rev.pubhub.model.User;
import com.rev.pubhub.service.UserService;
import com.rev.pubhub.util.EmailUtil;

@Controller
@RequestMapping("/users")
public class UserController {
	@Autowired
	UserService userService;
	User user = new User();
	EmailUtil eMail = new EmailUtil();

	@GetMapping("/register")
	public String login() {
		return "auth/register";
	}

	@PostMapping("/save")
	public String add_user(@ModelAttribute @Valid RegistrationValidation user, BindingResult result,ModelMap modelMap, 
			HttpSession session){
		try {

			System.out.println("Registraion Form :" + user);
			
			if (result.hasErrors()) {
				modelMap.addAttribute("errors", result.getAllErrors());
				modelMap.addAttribute("regFormData", user );
				return "user/register";
			}else {
				userService.save(user);
				
				return "redirect:../";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("regFormData", user );
			modelMap.addAttribute("ERROR_MESSAGE", e.getMessage());
			return "user/register";
		}
 
		
	}


	@GetMapping("/login")
	public String login_user() {
		return "auth/login";
	}

	@PostMapping("/validate")
	public String authorize(@RequestParam("email") String email, @RequestParam("password") String password,ModelMap modelMap,HttpSession session) {

		User user =userService.findByEmailAndPassword(email, password);
		
		if(user!=null){
			session.setAttribute("LOGGED_IN_USER", user);
			System.out.println("User logedin as " + email);
			modelMap.addAttribute("USER", user);
			return "bookDisplay/board";	
		}
		else{
			modelMap.addAttribute("ERROR_MESSAGE", "Invalid Email Id/Password");
			return "redirect:../users/login";
		}
	
		

	}

	@GetMapping("/logout")
	public String signOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";

	}

}
