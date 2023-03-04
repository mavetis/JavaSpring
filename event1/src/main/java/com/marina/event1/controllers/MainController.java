package com.marina.event1.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marina.event1.models.Event;
import com.marina.event1.models.User;
import com.marina.event1.services.MainService;
import com.marina.event1.validator.UserValidator;

@Controller
public class MainController {
@Autowired
private MainService mainService;
@Autowired
private UserValidator userValidator;

private final String[] states = { "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "IA", "ID",
        "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ",
        "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV",
        "WY" };

@GetMapping("/")
public String registerForm(@ModelAttribute("user") User user, Model model) {
	model.addAttribute("states", states);  
  return "index.jsp";
}
@PostMapping(value="/registration")
public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, Model model) {
	userValidator.validate(user, result);
	model.addAttribute("states", states);  
	if(result.hasErrors()) {
		return "index.jsp";
	}else{
	User u = mainService.registerUser(user);
	session.setAttribute("userId", u.getId());
	return "redirect:/events";
	}
}
@PostMapping(value="/login")
public String loginUser(@RequestParam("email") String email, @ModelAttribute("user") User user, @RequestParam("password") String password, Model model, HttpSession session) {
    boolean isAuthenticated = mainService.authenticateUser(email, password);
    if(isAuthenticated) {
    	User u =mainService.findByEmail(email); 
    	session.setAttribute("userId", u.getId() );
    	return "redirect:/events";
    }else {
    	model.addAttribute("error", "Invalid credentials. Try again!");
    	model.addAttribute("states", states);
    	return "index.jsp";
    }
}
@GetMapping("/logout")
public String logout(HttpSession session) {
	session.invalidate();
	return "redirect:/";
}

@GetMapping(value="/events")
public String showEvents(@ModelAttribute("event")Event event,Model model, HttpSession session) {
	Long userId = (Long) session.getAttribute("userId");
	User u = mainService.findUserById(userId);
	model.addAttribute("user", u);
	String state = u.getState();
	List<Event> eventsInState = mainService.eventsInState(state);
	model.addAttribute("eventsIn", eventsInState);
	List<Event> eventsOutState = mainService.eventsOutOfState(state);
	model.addAttribute("eventsOut", eventsOutState);
	model.addAttribute("states", states);  
	
	return "event.jsp";
}

@PostMapping(value="/events/create")
public String createEvent(@Valid @ModelAttribute("event") Event event, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
		
	    	return "event.jsp";
		}
		else {
			Long userId = (Long) session.getAttribute("userId");
	    	User u = mainService.findUserById(userId);
	    	model.addAttribute("user", u);
	    	String state = u.getState();
	    	List<Event> eventsIn = mainService.eventsInState(state);
	    	model.addAttribute("eventsIn", eventsIn);
	    	List<Event> eventsOut = mainService.eventsOutOfState(state);
	    	model.addAttribute("eventsOut", eventsOut);
	    	model.addAttribute("states", states);
			mainService.createEvent(event);
			return "redirect:/events";
		}
	
	
	}
}
