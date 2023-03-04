package com.marina.studentRoster3.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.studentRoster3.models.Contact;

@Repository
public interface ContactRepo extends CrudRepository<Contact, Long> {
List <Contact>findAll();
}
