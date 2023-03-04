package com.marina.of.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marina.of.models.Question;
import com.marina.of.models.Tag;
import com.marina.of.models.TagQuestion;
import com.marina.of.service.MainService;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	
	@RequestMapping("/questions")
	public String allQuestions(Model model) {
		List<Question> questions = mainService.allQuestions();
		model.addAttribute("questions", questions);
		return "dashboard.jsp";
	}
	
	@RequestMapping("/questions/new")
	public String newQ() {
		return "newQuestion.jsp";
	}
	
	@PostMapping("/questions/create")
	public String createQ(@RequestParam("question")String question,
						   @RequestParam("tag")String tag) {
		System.out.println(tag);
		System.out.println(question);
		String[] tagg = tag.split("\\s*,\\s*");
		Question quest = mainService.createQ(question);
		
		for(String tagz:tagg) {
			Tag returnTag = mainService.createTag(tagz);
			mainService.createQTag(new TagQuestion(quest, returnTag));
		}
		return "redirect:/questions";
	}
	
}
