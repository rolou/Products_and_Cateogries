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
<title>Nuevo Producto</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<main class="container mt-5">
    <div class="row justify-content-center">
        <form:form class="mt-5 col-md-5 border border-1 rounded p-4" action="/products/new" method="POST" modelAttribute="Product">
            <h1 class="mb-3">New Product</h1>
            <div class="mb-3">
                <form:label class="form-label" path="name">Name</form:label>
                <form:input class="form-control" path="name" />
                <form:errors class="text-danger" path="name"/>
            </div>
            <div class="mb-3">
                <form:label class="form-label" path="description">Description</form:label>
                <form:input class="form-control" path="description" />
                <form:errors class="text-danger" path="description"/>
            </div>
            <div class="mb-3">
                <form:label class="form-label" path="price">Price</form:label>
                <form:input class="form-control" path="price" />
                <form:errors class="text-danger" path="price"/>
            </div>
            <input class="btn btn-primary" type="submit" value="Create"/>
        </form:form>
    </div>
</main>
</body>
</html>