package com.marina.studentRoster3.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.studentRoster3.models.Course;

@Repository
public interface CourseRepo extends CrudRepository<Course, Long> {
List <Course>findAll();
}
