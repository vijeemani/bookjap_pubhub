package com.rev.pubhub.jsp;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rev.pubhub.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
 
	public User findByEmailAndPassword(String email ,String password);

	public User findByEmail(String emailId);
	

}
