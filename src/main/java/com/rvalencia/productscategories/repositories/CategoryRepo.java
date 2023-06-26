package com.rvalencia.productscategories.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.rvalencia.productscategories.models.Category;
import com.rvalencia.productscategories.models.Product;

public interface CategoryRepo extends CrudRepository<Category, Long> {
	List<Category> findByProductsNotContains(Product product);
}
