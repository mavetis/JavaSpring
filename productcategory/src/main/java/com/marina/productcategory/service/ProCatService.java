package com.marina.productcategory.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marina.productcategory.models.Category;
import com.marina.productcategory.models.CategoryProduct;
import com.marina.productcategory.models.Product;
import com.marina.productcategory.repositories.CategoryProductRepo;
import com.marina.productcategory.repositories.CategoryRepo;
import com.marina.productcategory.repositories.ProductRepo;

@Service
public class ProCatService {
	@Autowired
	private ProductRepo productRepo;
	@Autowired
	private CategoryRepo categoryRepo;
	@Autowired
	private CategoryProductRepo categoryProductRepo;
	
	public ProCatService(ProductRepo productRepo, CategoryRepo categoryRepo, CategoryProductRepo categoryProductRepo) {
		this.productRepo = productRepo;
		this.categoryRepo = categoryRepo;
		this.categoryProductRepo = categoryProductRepo;
	}
	
	//Product
	public Product addProd(Product product) {
		return productRepo.save(product);
	}
	
	public void setCat(Category category) {
		
	}

	
	public void addCatToProduct(CategoryProduct categoryProduct) {
		categoryProductRepo.save(categoryProduct);
	}
	
	public Product singleProd(Long id) {
		Optional<Product> product = productRepo.findById(id);
		if(product.isPresent()) {
			return product.get();
		}
		else {
			return null;
		}
	}
	
	public Iterable<Product> availableProductsForCategory(Category category) {
		return productRepo.findByCategoriesNotContains(category);
	}
	
	public Category addCat(Category category) {
		return categoryRepo.save(category);
	}
	
	public List<Category>getCatAll(){
		return categoryRepo.findAll();
	}
	public Iterable<Category> availableCatagoriesForProducts(Product product){
		return categoryRepo.findByProductsNotContains(product);
	}
	
	public void addProToCat(CategoryProduct categoryProduct) {
		categoryProductRepo.save(categoryProduct);
	}
	
	public Category singleCat(Long id) {
		Optional<Category> category = categoryRepo.findById(id);
		if(category.isPresent()) {
			return category.get();
		}
		else {
			return null;
		}
	}
	

}
