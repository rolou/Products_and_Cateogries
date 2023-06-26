package com.rvalencia.productscategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rvalencia.productscategories.models.Category;
import com.rvalencia.productscategories.models.Product;
import com.rvalencia.productscategories.repositories.CategoryRepo;

@Service
public class CategoryService {

	@Autowired
    private CategoryRepo categoryRepo;

    public void create(Category category) {
        categoryRepo.save(category);
    }

    public List<Category> findByProductsNotContains(Product product) {
        return categoryRepo.findByProductsNotContains(product);
    }

    public void addProduct(Long id, Product product) {
        Optional<Category> optionalCategory = categoryRepo.findById(id);
        if (optionalCategory.isPresent()) {
            Category category = optionalCategory.get();
            category.addProduct(product);
            categoryRepo.save(category);
        }
    }

    public Iterable<Category> findAll() {
        return categoryRepo.findAll();
    }

    public Category findById(Long id)  {
        Optional<Category> optionalCategory = categoryRepo.findById(id);
        if (optionalCategory.isPresent()) return optionalCategory.get();
        return null;
    }
}
