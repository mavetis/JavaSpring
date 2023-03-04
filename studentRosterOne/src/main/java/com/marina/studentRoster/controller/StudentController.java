package com.marina.studentRoster.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.marina.studentRoster.models.Student;
import com.marina.studentRoster.services.InfoService;
import com.marina.studentRoster.services.StudentService;

@Controller
public class StudentController {
	private final StudentService studentService;
//	private final InfoService infoService;
	
	public StudentController(StudentService studentService, InfoService infoService) {
//		this.infoService=infoService;
		this.studentService=studentService;
	}
	
	@RequestMapping("/student/new")
	public String newStudent(@ModelAttribute("std")Student student, Model model) {
		return "index.jsp";
	}
	
	@RequestMapping(value="/processStudent", method=RequestMethod.POST)
	public String addStudent(@Valid@ModelAttribute("std")Student student, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("Thers an error");
			return "index.jsp";
		}
		else {
			studentService.addStudent(student);
			return "redirect:info/new";
		}
	}
}
