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
<title>Categorias</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<main class="container mt-5">
    <h1 class="mb-3">${category.name}</h1>
    <div class="row justify-content-center">
        <section class="col-6">
            <h2>Products:</h2>
            <ul>
                <c:forEach items="${category.products}" var="product">
                    <li>${product.name}</li>
                </c:forEach>
            </ul>
        </section>
        <section class="col-6">
            <form:form action="/categories/${category.id}" method="post" modelAttribute="Category">
                <input type="hidden" name="_method" value="put">
                <div class="mb-3">
                    <form:label class="form-label" path="products">Add Category</form:label>
                    <form:select class="form-select" path="products">
                        <c:forEach items="${productsList}" var="products">
                            <form:option value="${products.id}">
                                ${products.name}
                            </form:option>
                        </c:forEach>
                    </form:select>
                </div>
<%--                 <c:if test="${fn:length(productsList) > 0}"> --%>
                   <button class="btn btn-primary float-end">Add Product</button>
<%--                 </c:if> --%>
            </form:form>
        </section>
    </div>
</main>
</body>
</html>