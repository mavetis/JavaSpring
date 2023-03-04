package com.marina.auth.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.auth.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	 User findByEmail(String email);
}
