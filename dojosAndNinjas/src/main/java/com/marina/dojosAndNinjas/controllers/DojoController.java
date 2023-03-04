package com.marina.dojosAndNinjas.controllers;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.marina.dojosAndNinjas.models.Dojo;
import com.marina.dojosAndNinjas.service.DojoNinjaService;

@Controller
public class DojoController {
	private final DojoNinjaService dojoNinjaService;
	
	public DojoController(DojoNinjaService dojoNinjaService) {
		this.dojoNinjaService=dojoNinjaService;
	}
	
	@RequestMapping("/dojos/new")
	public String newDojo(@ModelAttribute("newDojo")Dojo dojo) {
		return "dojo.jsp";
	}
	
	@RequestMapping(value="/process", method=RequestMethod.POST)
	public String addDojo(@Valid@ModelAttribute("newDojo")Dojo dojo, BindingResult result) {
		if(result.hasErrors()) {
			return"/dojo.jsp";
		}
		else {
			dojoNinjaService.addDojo(dojo);
			return "redirect:ninjas/new";
		}
	}
	
	@RequestMapping("/dojo/{dojoId}")
	public String showDojo(@PathVariable("dojoId") long id, Model model) {
		Dojo dojo = dojoNinjaService.singleDojo(id);
		model.addAttribute("dojo", dojo);
		return "show.jsp";
	}
}
