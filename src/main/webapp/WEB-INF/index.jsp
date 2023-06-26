<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<main class="container">
        <div class="row mt-5">
            <h1>Product & Categories</h1>
            <a href="/products/new">Create New Product</a>
            <a href="/categories/new">Create New Category</a>
            <h5 class="mt-5">Products</h5>
            <table class="table table-striped border border-1">
                <thead>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Categories</th>
                </thead>
                <tbody>
                    <c:forEach items="${productsList}" var="product">
                        <tr>
                            <td><a href="/products/${product.id}">${product.name}</a></td>
                            <td>${product.description}</td>
                            <td>${product.price}</td>
                            <td>
                                <ul class>
                                    <c:forEach items="${product.categories}" var="category">
                                        <li class=""><a href="categories/${category.id}">${category.name}</a></li>
                                    </c:forEach>
                                </ul>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="row">
                <h5 class="mt-5">Categories</h5>
                <ul class="list-group list-group-horizontal flex-wrap">
                    <c:forEach items="${categoriesList}" var="category">
                        <li class="list-group-item"><a href="/categories/${category.id}">${category.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </main>
</body>
</html>