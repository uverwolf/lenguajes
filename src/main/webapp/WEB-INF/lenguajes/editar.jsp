<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<title>Editando <c:out value="${lenguajeEditable.nombre}"></c:out> </title>
</head>
<body>
    <div class="container-fluid col-10">
        <div class="d-flex flex-row col-6 mx-auto my-5 bg bg-success border border-dark rounded text-center text-light">
            <form:form action="/lenguajes/${lenguajeEditable.id}" class="col-12" method="PUT" modelAttribute="lenguajeEditable">
                <input type="hidden" name="_method" value="put">
                <h1 class="text-center">Actualizar lenguaje</h1>
                <div class="form-group">
                    <form:label path="nombre">Nombre</form:label>
                    <form:errors class="text-danger" path="nombre"/>
                    <form:input path="nombre"/>
                </div>
                <div class="form-group">
                    <form:label path="creador">Creador</form:label>
                    <form:errors class="text-danger" path="creador"/>
                    <form:input path="creador"/>
                </div>
                <div class="form-group">
                    <form:label path="version">Version</form:label>
                    <form:errors class="text-danger" path="version"/>
                    <form:input path="version"/>
                </div>
                <a class="btn btn-info mb-2" href="/lenguajes">Volver</a>
                <input type="submit" class="btn btn-secondary mb-2" value="Actualizar">
                
            </form:form>
        </div>
    </div>

</body>
</html>