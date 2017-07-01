package com.rev.pubhub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.rev.pubhub.form.RegistrationValidation;
import com.rev.pubhub.jsp.UserRepository;
import com.rev.pubhub.model.Order;
import com.rev.pubhub.model.User;
import com.rev.pubhub.util.EmailUtil;

@Service
public class UserService {

	@Autowired
	UserRepository userRepository;
	@Autowired
	EmailUtil eMail;

	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	public void save(RegistrationValidation Rvalidate) throws Exception {
		User user = userRepository.findByEmail(Rvalidate.getEmail());
		System.out.println("Is email already exists? " + user);
		if (user != null) {
			throw new Exception("Email already exists!!!");
		}

		String hashedPassword = passwordEncoder.encode(Rvalidate.getPassword());
		System.out.println(hashedPassword);
		User userObj = new User();
		userObj.setName(Rvalidate.getName());
		userObj.setEmail(Rvalidate.getEmail());
		userObj.setPassword(hashedPassword);

		userRepository.save(userObj);

		// Send Registration Notification Mail
		String subject = "Your account has been created";
		String body = "Welcome to p ! You can login to your account !";
		// emailUtil.send(user.getEmail(), subject, body);

	}

	public User findByEmailAndPassword(String email, String password) {

		return userRepository.findByEmailAndPassword(email, password);
		// TODO Auto-generated method stub

	}

	public String sendOrderDetails(String emails, Order order, String name) throws Exception {
		// User userOrder = new User();
		Order orderd = new Order();
		System.out.println(emails);
		String result = "An email has been sent to u";
		// String nameOfUser=userOrder.getName();
		// String emailOfuser =userOrder.getEmail();
		Long orderId = orderd.getId();
		Integer Amount = orderd.getTotalPrice();
		String subject = "order-Confrimaion";
		String message = "Dear" + name + " your order" + orderId + " of total" + Amount
				+ "Has been placed successfully";
		eMail.send(emails, subject, message);

		return result;

	}

}
