package com.marina.overflow.controllers;

import javax.validation.Valid;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marina.overflow.models.Answer;
import com.marina.overflow.models.NewQuestion;
import com.marina.overflow.models.Question;
import com.marina.overflow.service.MainService;

@SpringBootApplication
@Controller
public class HomeController {
	private final MainService mainService;
	
	public HomeController(MainService mainService) {
		this.mainService=mainService;
	}
	
	@RequestMapping("/questions")
	public String dashboard(Model model) {
		model.addAttribute("questions", mainService.getAllQuestion());
		return "dashboard.jsp";
	}
	
	@RequestMapping("/questions/new")
	public String newQuestion(@ModelAttribute("addQuestion")Question question) {
		return "newQuestion.jsp";
	}
	@PostMapping("/questions/process")
	public String Create(@Valid @ModelAttribute("addQuestion") NewQuestion newQuest, 
		BindingResult result) {
		if(result.hasErrors())
			return "newQuestion.jsp";
		else {
			this.mainService.createQuestion(newQuest);
			return "redirect:/questions";	
		}
		
	}
	@GetMapping("/questions/{id}")
	public String Show(@PathVariable("id") Long id, @ModelAttribute("ans") Answer ans, Model model) {
		model.addAttribute("question", this.mainService.getQuestion(id));
		return "show.jsp";
	}
	
	@PostMapping("/questions/answers")
	public String CreateAnswer(@Valid @ModelAttribute("ans") Answer ans, BindingResult result) {
		if(result.hasErrors()) {
			return "show.jsp";
		}
			
		Answer newAnswer = this.mainService.createAnswer(ans);
		return "redirect:/questions/" + newAnswer.getQuestion().getId();
	}

}