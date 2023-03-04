package com.marina.studentRosterII.controller;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.marina.studentRosterII.models.Dormitory;
import com.marina.studentRosterII.models.Student;
import com.marina.studentRosterII.services.DormStudentService;

@Controller
public class MainController {
	@Autowired
	private DormStudentService dormStudentService;
	
	public MainController(DormStudentService dormStudentService) {
		this.dormStudentService=dormStudentService;
	}
	
	@RequestMapping("/dorm/new")
	public String newDorm(@ModelAttribute("newDorm") Dormitory dormitory) {
		return "dorm.jsp";
	}
	
	@RequestMapping(value="/processDorm", method=RequestMethod.POST)
	public String addDorm(@Valid@ModelAttribute("newDorm")Dormitory dormitory, 
							BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("has Errors");
			return "dorm.jsp";
		}
		else {
			dormStudentService.addDorm(dormitory);
			System.out.println("has Errorss");

			return "redirect:/dorm/"+dorm().getId();
		}
	}
	
	@RequestMapping("dorm/{dormitoryId}")
	public String newStudent(@ModelAttribute("addStudent")Student student, Model model) {
		List<Student> students = dormStudentService.getAllStudents();
		model.addAttribute("students", students);
		return "students.jsp";
	}
	
	@RequestMapping(value="/processStudent", method=RequestMethod.POST)
	public String addStudent(@Valid
							 @ModelAttribute("addStudent")Student student,
							 BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "students.jsp";
		}
		else {
			dormStudentService.addStudent(student);
			return "redirect:/student/new";
		}
	}
}
