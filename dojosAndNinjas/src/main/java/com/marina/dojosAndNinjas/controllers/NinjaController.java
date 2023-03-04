package com.marina.dojosAndNinjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.marina.dojosAndNinjas.models.Dojo;
import com.marina.dojosAndNinjas.models.Ninja;
import com.marina.dojosAndNinjas.service.DojoNinjaService;


@Controller
public class NinjaController {
	private final DojoNinjaService dojoNinjaService;
	
	public NinjaController(DojoNinjaService dojoNinjaService) {
		this.dojoNinjaService=dojoNinjaService;
	}
	
	@RequestMapping("/ninjas/new")
	public String newNinja(@ModelAttribute("newNinja")Ninja ninja, Model Model) {
		List <Dojo> dojoList = dojoNinjaService.getAllDojos();
		Model.addAttribute("dojoList", dojoList);
		return "/newNinja.jsp";
	}
	
	@RequestMapping(value="/processNinja", method=RequestMethod.POST)
	public String addNinja(@Valid@ModelAttribute("newNinja")Ninja ninja,BindingResult result) {
		if(result.hasErrors()) {
			return "/newNinja.jsp";
		}
		else {
			dojoNinjaService.addNinja(ninja);
			//remember Ninja needs to get the dojo, then get the id.
			return "redirect:/dojo/" + ninja.getDojo().getId();
		}
	}
}
