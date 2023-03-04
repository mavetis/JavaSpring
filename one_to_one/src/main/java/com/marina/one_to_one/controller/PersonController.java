package com.marina.one_to_one.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.marina.one_to_one.models.Person;
import com.marina.one_to_one.service.LicenseService;
import com.marina.one_to_one.service.PersonService;

@Controller
public class PersonController {
	private final PersonService personService;
//	private final LicenseService licenseService;
	
	public PersonController(PersonService personService, LicenseService licenseService) {
		this.personService=personService;
//		this.licenseService=licenseService;
	}
	
	@RequestMapping("/person/new")
	public String newPerson(@ModelAttribute("ppl")Person person, Model model) {
		return "index.jsp";
	}
	
	@RequestMapping(value="/processPerson", method=RequestMethod.POST)
	public String addPerson(@Valid@ModelAttribute("ppl")Person person, BindingResult result) {
		if(result.hasErrors()) {
			return "index.jsp";
		}
		else {
			personService.addPerson(person);
			return "redirect:license/new";
		}
	}
}
