package com.marina.studentRoster3.services;

import java.util.List;
//import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marina.studentRoster3.models.Contact;
import com.marina.studentRoster3.models.Course;
import com.marina.studentRoster3.models.Dorm;
import com.marina.studentRoster3.models.Student;
//import com.marina.studentRoster3.models.StudentContact;
//import com.marina.studentRoster3.models.StudentCourse;
import com.marina.studentRoster3.repo.ContactRepo;
import com.marina.studentRoster3.repo.CourseRepo;
import com.marina.studentRoster3.repo.DormRepo;
//import com.marina.studentRoster3.repo.StudentContactRepo;
//import com.marina.studentRoster3.repo.StudentCourseRepo;
import com.marina.studentRoster3.repo.StudentRepo;

@Service
public class MainService {
	@Autowired
	private StudentRepo studentRepo;
	
	@Autowired 
	private CourseRepo courseRepo;
	
	@Autowired
	private ContactRepo contactRepo;
	
	@Autowired
	private DormRepo dormRepo;
	
//	@Autowired
//	private StudentCourseRepo studentCourseRepo;
//	
//	@Autowired
//	private StudentContactRepo studentContactRepo;
	
	public MainService(StudentRepo studentRepo, CourseRepo courseRepo, ContactRepo contactRepo, DormRepo dormRepo) {
		this.studentRepo=studentRepo;
		this.contactRepo=contactRepo;
		this.courseRepo=courseRepo;
		this.dormRepo=dormRepo;
//		this.studentCourseRepo=studentCourseRepo;
//		this.studentContactRepo=studentContactRepo;
	}
	
	//create 
	
	public Student create(Student student) {
		return this.studentRepo.save(student);
	}
	public Contact createContact(Contact contact) {
		return this.contactRepo.save(contact);
	}
	
	public Dorm createDorm(Dorm dorm) {
		return this.dormRepo.save(dorm);
	}
	public Course createCourse(Course course) {
		return this.courseRepo.save(course);
	}
	
	//find all
	
	public List<Student> allStudents(){
		return this.studentRepo.findAll();
	}
	public List<Contact>allContacts(){
		return this.contactRepo.findAll();
	}
	public List<Course> allCourses(){
		return this.courseRepo.findAll();
	}
	public List<Dorm>allDorms(){
		return this.dormRepo.findAll();
	}

	//find by Single id
	
	public Student getSingleStudent(Long id) {
		return this.studentRepo.findById(id).orElse(null);
	}
	public Contact getSingleContact(Long id) {
		return this.contactRepo.findById(id).orElse(null);
	}
	public Course getSingleCourse(Long id) {
		return this.courseRepo.findById(id).orElse(null);
	}
	public Dorm getSingleDorm(Long id) {
		return this.dormRepo.findById(id).orElse(null);
	}
	
	//delete
	public void deleteStudent(Long id) {
		this.studentRepo.deleteById(id);
	}
	public void deleteContact(Long id) {
		this.contactRepo.deleteById(id);
	}
	public void deleteCourse(Long id) {
		this.courseRepo.deleteById(id);
	}
	public void deleteDorm(Long id) {
		this.dormRepo.deleteById(id);
	}
	
}

