package com.marina.studentRoster3.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marina.studentRoster3.models.Contact;
import com.marina.studentRoster3.models.Dorm;
import com.marina.studentRoster3.models.Student;
import com.marina.studentRoster3.models.StudentContact;
import com.marina.studentRoster3.services.MainService;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	
	@GetMapping("/students")
	public String allStudents(Model model) {
		List<Student> students = this.mainService.allStudents();
		List<Contact>contact=mainService.allContacts();
		List <Dorm> allDorms=this.mainService.allDorms();
		model.addAttribute("students",students);
		model.addAttribute("contact", contact);
		model.addAttribute("allDorms", allDorms);

		return "students.jsp";
	}
	

	
	@GetMapping("/students/new")
	public String newStudent(@ModelAttribute("student")Student student, Model model) {
		model.addAttribute("student", student);
		return "newStudent.jsp";
	}
	
	@PostMapping("/processStudent")
	public String addStudent(@Valid@ModelAttribute("student")Student student,
								BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("Has Errors");
			return "newStudent.jsp";
		}else {
			mainService.create(student);
			return "redirect:/contact/new";
		}
	}
	
	@GetMapping("/contact/new")
	public String addContact(@ModelAttribute("contact")Contact contact, Model model) {
		List<Student> students=this.mainService.allStudents();
		model.addAttribute("students", students);
		return "newContact.jsp";
	}
	@PostMapping("/processContact")
	public String createContact(@Valid@ModelAttribute("contact")Contact contact,
									BindingResult result) {
		if(result.hasErrors()){
			System.out.println("Error present");
			return "newContract.jsp";
		}else {
			this.mainService.createContact(contact);
			return "redirect:/students";
		}
	}
	
	@GetMapping("/dorms/new")
	public String createDorm(@ModelAttribute("dorm")Dorm dorm, Model model) {
		return "newDorm.jsp";
	}
	
	@PostMapping("/processDorm")
	public String bindDorm(@Valid@ModelAttribute("dorm")Dorm dorm, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("Error present");
			return "newDorm.jsp";
		}else {
			mainService.createDorm(dorm);
			return "redirect:/dorms/"+dorm.getId();
		}
	}
	
	@GetMapping("/dorms/{id}")
	public String showDorm(@PathVariable("id")Long id, Model model) {
		Dorm dormCreated = this.mainService.getSingleDorm(id);
		List<Student> students = this.mainService.allStudents();
		model.addAttribute("students", students);
		model.addAttribute("dorm", dormCreated);
		return "dormId.jsp";
	}
	
	@PostMapping("/dorms/addStudent")
	public String addStudent(@PathVariable("dorm_id") Long dorm_id, @RequestParam(value="student", required=false) Long student_id) {
	Student student=this.mainService.getSingleStudent(student_id);
	Dorm dorm = this.mainService.getSingleDorm(dorm_id);
	student.setDorm(dorm);
	return "redirect:/students";
	}
//	@PostMapping("/dorms/addStudent")
//	public String addStudent(@RequestParam("id")Long id,
//							 @RequestParam("id")Long id) {
//		Dorm thisdorm=mainService.getSingleDorm(id);
//		Student thisStudent=mainService.getSingleStudent(id);
//		thisStudent.setDorm(thisdorm);
//		mainService.create(thisStudent);
//		return "redirect:/dorms/{id}";
//	}
	
//	@RequestMapping(value="/dorms/addStrudent", method=RequestMethod.POST)
//	public String addStudent(@ModelAttribute("dorm")Dorm dorm, Model model) {
//	Dorm thisDorm=mainService.singleDorm());
//	}
}
