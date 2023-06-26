package com.rvalencia.productscategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rvalencia.productscategories.models.Category;
import com.rvalencia.productscategories.models.Product;
import com.rvalencia.productscategories.repositories.ProductRepo;

@Service
public class ProductService {

	@Autowired
    private ProductRepo productRepo;

    public void create(Product product) {
        productRepo.save(product);
    }

    public Iterable<Product> findAll() {
        return productRepo.findAll();
    }

    public Product findById(Long id) {
        Optional<Product> optionalProduct = productRepo.findById(id);
        if (optionalProduct.isPresent()) return optionalProduct.get();
        return null;
    }

    public List<Product> findByCategoriesNotContains(Category category) {
        return productRepo.findByCategoriesNotContains(category);
    }

    public void addCategory(Long id, Category category) {
        Optional<Product> optionalProduct = productRepo.findById(id);
        if (optionalProduct.isPresent()) {
            Product product = optionalProduct.get();
            product.addCategory(category);
            productRepo.save(product);
        }
    }
}
