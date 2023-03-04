package com.marina.studentRoster.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.marina.studentRoster.models.Info;
import com.marina.studentRoster.models.Student;
import com.marina.studentRoster.services.InfoService;
import com.marina.studentRoster.services.StudentService;

@Controller
public class InfoController {
	private final InfoService infoService;
	private final StudentService studentService;
	
	public InfoController(InfoService infoService, StudentService studentService) {
		this.infoService=infoService;
		this.studentService=studentService;
	}
	
	@RequestMapping("/info/new")
	public String showInfo(@ModelAttribute("a")Info info, Model model) {
		List<Student> studentList = studentService.allStudent();
		model.addAttribute("studentList",studentList);
		ArrayList<String> states = new ArrayList<String>(Arrays.asList("Alabama", "Alaska", "Arizona",
				"Arkansas", "California", "Colorado", "Connecticut",
				"Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas",
				"Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
				"Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey",
				"New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
				"Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas",
				"Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"));
		model.addAttribute("states",states);
		return "info.jsp";
	}	
	
	@RequestMapping(value="/processInfo", method=RequestMethod.POST)
	public String processInfo(@Valid@ModelAttribute("a")Info info, BindingResult result) {
		if(result.hasErrors()) {
			return "info.jsp";
		}else {
			infoService.addInfo(info);
			return"redirect:/students";
		}
	}
	@RequestMapping("/students")
	public String showAll(Model model) {
		List<Student> students= studentService.allStudent();
		List <Info> infos= infoService.allInfo();
		model.addAttribute("infos",infos);
		model.addAttribute("students", students);
		return "show.jsp";
	}
	

}
