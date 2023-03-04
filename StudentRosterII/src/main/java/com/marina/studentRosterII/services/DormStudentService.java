package com.marina.studentRosterII.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marina.studentRosterII.models.Dormitory;
import com.marina.studentRosterII.models.Student;
import com.marina.studentRosterII.repositories.DormRepo;
import com.marina.studentRosterII.repositories.StudentRepo;

@Service
public class DormStudentService {
	@Autowired
	private DormRepo dormRepo;
	@Autowired
	private StudentRepo studentRepo;
	
	public DormStudentService(DormRepo dormRepo, StudentRepo studentRepo) {
		this.dormRepo=dormRepo;
		this.studentRepo=studentRepo;
	}
	
	public void addDorm(Dormitory dormitory) {
		dormRepo.save(dormitory);
	}
	
	public List <Dormitory> getAllDorms(){
		return dormRepo.findAll();
	}
	
	public Dormitory singleDorm(Long id) {
		Optional<Dormitory> dormitory=dormRepo.findById(id);
		if(dormitory.isPresent()) {
			return dormitory.get();
		}
		else {
			return null;
		}
	}
	
	public void addStudent(Student student) {
		studentRepo.save(student);
	}
	
	public List <Student> getAllStudents(){
		return studentRepo.findAll();
	}
	
	public Student singleStudent(Long id) {
		Optional<Student> student=studentRepo.findById(id);
		if(student.isPresent()) {
			return student.get();
		}
		else {
			return null;
		}
	}
}
