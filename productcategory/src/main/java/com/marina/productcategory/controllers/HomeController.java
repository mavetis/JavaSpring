package com.marina.productcategory.controllers;


import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.marina.productcategory.models.Category;
import com.marina.productcategory.models.CategoryProduct;
import com.marina.productcategory.models.Product;
import com.marina.productcategory.service.ProCatService;

@Controller
public class HomeController {


	private final ProCatService proCatService;
	public HomeController(ProCatService proCatService) {
		this.proCatService=proCatService;
	}
	
	// Product
	
	@RequestMapping("/products/new")
	public String newProduct(@ModelAttribute("product")Product product) {
		return "product.jsp";
	}
	
	@RequestMapping(value="/processProduct", method=RequestMethod.POST)
	public String addProduct(@Valid@ModelAttribute("product")Product product,BindingResult result) {
		if(result.hasErrors()) {
			return"product.jsp";
		}
		else {
			Product newProduct = proCatService.addProd(product);
			return"redirect:/products/new/"+newProduct.getId();
		}
	}
	@RequestMapping("/products/new/{id}")
	public String showProduct(@PathVariable("id")Long id,
			@ModelAttribute("catPro")CategoryProduct categoryProduct,Model model) {
		Product product = proCatService.singleProd(id);
		model.addAttribute("product", product);
		model.addAttribute("categories", proCatService.availableCatagoriesForProducts(product));
		return "showProduct.jsp";
	}
	@RequestMapping(value="/attachCategory", method=RequestMethod.POST)
	public String attachCategory(@ModelAttribute("catPro")CategoryProduct categoryProduct,Model model) {
//		System.out.println(categoryProduct.getCategory().getName()); // to check if its going through
//		System.out.println(categoryProduct.getProduct().getName());
		proCatService.addCatToProduct(categoryProduct);
		return "redirect:/products/new/" + categoryProduct.getProduct().getId();
	}

	
	// Category
	
	@RequestMapping("/categories/new")
	public String newCategory(@ModelAttribute("category")Category category) {
		return "category.jsp";
	}
	
	@RequestMapping(value="/processCategory", method=RequestMethod.POST)
	public String addCategory(@Valid@ModelAttribute("category")Category category,BindingResult result) {
		if(result.hasErrors()) {
			return"category.jsp";
		}
		else {
			Category newCategory = proCatService.addCat(category);
			return"redirect:/categories/new/" + newCategory.getId();
		}
	}
	@GetMapping("/categories/new/{id}")
	public String showCat(@PathVariable("id")Long id,
							@ModelAttribute("proCat")CategoryProduct categoryProduct, Model model) {
		Category category = proCatService.singleCat(id);
		model.addAttribute("category", category);
		model.addAttribute("products", proCatService.availableProductsForCategory(category));
		return "showCategory.jsp";
	}
	
	@RequestMapping(value="/attachProduct", method=RequestMethod.POST)
	public String attachProduct(@ModelAttribute("proCat")CategoryProduct categoryProduct, Model model) {
	proCatService.addProToCat(categoryProduct);
	return"redirect:/categories/new/"+ categoryProduct.getCategory().getId();
	}



}