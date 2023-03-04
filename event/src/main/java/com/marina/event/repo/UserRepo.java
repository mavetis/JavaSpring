package com.marina.event.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.event.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long> {
User findByEmail(String email);
}
