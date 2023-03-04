package com.marina.studentRoster3.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.studentRoster3.models.StudentCourse;

@Repository
public interface StudentCourseRepo extends CrudRepository <StudentCourse, Long> {
List <StudentCourse>findAll();

}
