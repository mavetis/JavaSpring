package com.marina.studentRoster3.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.studentRoster3.models.Student;

@Repository
public interface StudentRepo extends CrudRepository<Student, Long> {
List <Student>findAll();
}
