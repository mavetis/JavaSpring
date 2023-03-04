package com.marina.studentRosterII.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.studentRosterII.models.Student;

@Repository
public interface StudentRepo extends CrudRepository<Student, Long> {
	List<Student> findAll();
}
