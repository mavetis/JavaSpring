package com.marina.one_to_one.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.one_to_one.models.Person;

@Repository
public interface PersonRepository extends CrudRepository<Person, Long> {
	
	List<Person> findAll();
}
