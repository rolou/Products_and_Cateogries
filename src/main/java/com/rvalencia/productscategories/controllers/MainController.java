package com.rvalencia.productscategories.controllers;

import java.util.Locale.Category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rvalencia.productscategories.models.Product;
import com.rvalencia.productscategories.services.CategoryService;
import com.rvalencia.productscategories.services.ProductService;

import jakarta.validation.Valid;

@Controller
public class MainController {
	
	 @Autowired
	    private ProductService productService;

	    @Autowired
	    private CategoryService categoryService;

	    @GetMapping("/")
	    public String index(Model model) {
	        model.addAttribute("productsList", productService.findAll());
	        model.addAttribute("categoriesList", categoryService.findAll());
	        return "index.jsp";
	    }

	    // Products
	    @GetMapping("/products/new")
	    public String get(@ModelAttribute("Product") Product product) {
	        return "newProduct.jsp";
	    }

	    @PostMapping("/products/new")
	    public String create(
	            @Valid
	            @ModelAttribute("Product") Product product,
	            BindingResult result
	    ) {
	        System.out.println(result.toString());
	        if (result.hasErrors()) return "newProduct.jsp";
	        productService.create(product);
	        return "redirect:/";
	    }

	    @GetMapping("/products/{id}")
	    public String get(
	            @PathVariable("id") Long id,
	            @ModelAttribute("Product") Product product,
	            Model model
	    ) {
	        model.addAttribute(
	                "categoriesList",
	                categoryService.findByProductsNotContains(productService.findById(id))
	        );
	        model.addAttribute("product", productService.findById(id));
	        return "product.jsp";
	    }

	    @PutMapping("/products/{id}")
	    public String addCategory(
	            @PathVariable("id") Long id,
	            @RequestParam("categories") Category category
	    ) {
	    	productService.addCategory(id, category);
	        return "redirect:/products/" + id;
	    }

	    // Categories
	    @GetMapping("/categories/new")
	    public String get(@ModelAttribute("Category") Category category) {
	        return "newCategory.jsp";
	    }

	    @PostMapping("/categories/new")
	    public String create(
	            @Valid
	            @ModelAttribute("Category") Category category,
	            BindingResult result
	    ) {
	        if (result.hasErrors()) return "newCategory.jsp";
	        categoryService.create(category);
	        return "redirect:/";
	    }


	    @GetMapping("/categories/{id}")
	    public String get(
	            @PathVariable("id") Long id,
	            @ModelAttribute("Category") Category category,
	            Model model
	    ) {
	        model.addAttribute(
	                "productsList",
	                productService.findByCategoriesNotContains(categoryService.findById(id))
	        );
	        model.addAttribute("category", categoryService.findById(id));
	        return "category.jsp";
	    }

	    @PutMapping("/categories/{id}")
	    public String addCategory(
	            @PathVariable("id") Long id,
	            @RequestParam("products") Product product
	    ) {
	        categoryService.addProduct(id, product);
	        return "redirect:/categories/" + id;
	    }
}
