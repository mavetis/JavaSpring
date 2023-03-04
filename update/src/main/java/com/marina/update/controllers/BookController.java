package com.marina.update.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.marina.update.models.Book;
import com.marina.update.services.BookService;

@Controller
public class BookController {
	   private final BookService bookService;
	   
	   public BookController(BookService bookService) {
		   this.bookService=bookService;
	   }
	   @RequestMapping("/books/new")
	    public String newBook(@ModelAttribute("book") Book book) {
	        return "/books/new.jsp";
	    }
	   
	   @RequestMapping(value="/books", method=RequestMethod.POST)
	   public String create(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		   if(result.hasErrors()) {
			   return "/books/new.jsp";
		   } else {
			   bookService.createBook(book);
			   return "redirect:/books";
		   }
	   }
	    @RequestMapping("/books")
	    public String index(Model model) {
	        List<Book> books = bookService.allBooks();
	        model.addAttribute("books", books);
	        return "/books/index.jsp";
	    }
//	    @RequestMapping("/show/{id}")
//	    public String show(@PathVariable("id") Long id, Model model) {
//	    	Book book = bookService.findBook(id);
//	    	model.addAttribute("book", book);
//	    	return "books/show.jsp";
	    //}
	    @RequestMapping("/books/{id}/edit")
	    public String edit(@PathVariable("id") Long id, Model model) {
	        Book book = bookService.findBook(id);
	        model.addAttribute("book", book);
	        return "/books/edit.jsp";
	    }
	    
	    @RequestMapping(value="/books/{id}/edit", method=RequestMethod.POST)
	    public String update(
	    					@Valid @ModelAttribute("book") Book book, BindingResult result) {
	        if (result.hasErrors()) {
	            return "/books/edit.jsp";
	        } else {
	            bookService.updateBook(book);
	            return "redirect:/books";
	        }
	    }
	    
	    @RequestMapping(value="/books/{id}/delete", method = {RequestMethod.GET, RequestMethod.POST})
	    public String destroy(@PathVariable("id") Long id) {
	        bookService.deleteBook(id);
	        return "redirect:/books";
	    }
	  
}
