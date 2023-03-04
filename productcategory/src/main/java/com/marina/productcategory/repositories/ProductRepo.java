package com.marina.productcategory.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.productcategory.models.Category;
import com.marina.productcategory.models.Product;

@Repository
public interface ProductRepo extends CrudRepository<Product, Long> {
	List<Product> findAll();
	List<Product> findByCategoriesNotContains(Category category);
}
