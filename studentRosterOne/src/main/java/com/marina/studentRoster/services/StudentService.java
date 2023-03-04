package com.marina.studentRoster.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.marina.studentRoster.models.Student;
import com.marina.studentRoster.repositories.StudentRepo;

@Service
public class StudentService {
	private final StudentRepo studentRepo;
	
	public StudentService(StudentRepo studentRepo) {
		this.studentRepo=studentRepo;
	}
	
	public List<Student> allStudent(){
		return studentRepo.findAll();
	}
	
	public Student addStudent(Student student) {
		return studentRepo.save(student);
	}
	
//	public Student getStudent(Long sId) {
//		Optional<Student>student = studentRepo.findById(sId);
//		if(student.isPresent()) {
//			System.out.println(student.get());
//			return student.get();
//		}else {
//			return null;
//		}
//	}
	
	public Optional<Student>getStudent(Long sId){
		return studentRepo.findById(sId);
	}
}
