package com.marina.one_to_one.controller;

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

import com.marina.one_to_one.models.License;
import com.marina.one_to_one.models.Person;
import com.marina.one_to_one.service.LicenseService;
import com.marina.one_to_one.service.PersonService;

@Controller
public class LicenseController {
private final LicenseService licenseService;
private final PersonService personService;

public LicenseController(PersonService personService, LicenseService licenseService) {
	this.licenseService=licenseService;
	this.personService=personService;
}

@RequestMapping("license/new")
public String showLicense(@ModelAttribute("license")License license, Model model) {
	List <Person> personList = personService.allPerson();
	model.addAttribute("personList",personList);
	ArrayList<String> states = new ArrayList<String>(Arrays.asList("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut",
			"Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas",
			"Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
			"Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey",
			"New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
			"Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas",
			"Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"));
	model.addAttribute("states",states);
	return "newLicense.jsp";
}
@RequestMapping(value="/addLicense", method=RequestMethod.POST)
public String addLicense(@Valid@ModelAttribute("license")License license, BindingResult result) {
	if(result.hasErrors()) {
		return "newLicense.jsp";
	}
	else {
		String number = licenseService.generateLicenseNumber();
		license.setNumber(number);
		licenseService.addLicense(license);
		return "redirect:/person/"+license.getId();
	}
}

@RequestMapping("/person/{id}")
public String showInfo(@PathVariable("id")Long id, Model model) {
	model.addAttribute("license", licenseService.getLicense(id).get());
	return "show.jsp";
}
}
