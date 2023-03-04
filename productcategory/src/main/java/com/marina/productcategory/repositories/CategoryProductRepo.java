package com.marina.productcategory.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.productcategory.models.CategoryProduct;

@Repository
public interface CategoryProductRepo extends CrudRepository<CategoryProduct, Long>{
	
}
