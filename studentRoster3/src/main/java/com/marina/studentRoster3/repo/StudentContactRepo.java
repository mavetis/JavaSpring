package com.marina.studentRoster3.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.studentRoster3.models.StudentContact;

@Repository
public interface StudentContactRepo extends CrudRepository<StudentContact, Long> {
	List <StudentContact>findAll();
}
