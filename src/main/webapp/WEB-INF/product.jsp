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
<title>Producto</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<main class="container mt-5">
    <h1 class="mb-3">${product.name}</h1>
    <div class="row justify-content-center">
        <section class="col-6">
            <h2>Categories:</h2>
            <ul>
                <c:forEach items="${product.categories}" var="category">
                    <li>${category.name}</li>
                </c:forEach>
            </ul>
        </section>
        <section class="col-6">
            <form:form action="/products/${product.id}" method="post" modelAttribute="Product">
                <input type="hidden" name="_method" value="put">
                <div class="mb-3">
                    <form:label class="form-label" path="categories">Add Category</form:label>
                    <form:select class="form-select" path="categories">
                        <c:forEach items="${categoriesList}" var="category">
                            <form:option value="${category.id}">
                                ${category.name}
                            </form:option>
                        </c:forEach>
                    </form:select>
                    <form:errors class="text-danger" path="categories"/>
                </div>
<%--                 <c:if test="${fn:length(categoriesList) > 0}"> --%>
                   <button class="btn btn-primary float-end">Add Category</button>
<%--                 </c:if> --%>
            </form:form>
        </section>
    </div>
</main>
</body>
</html>