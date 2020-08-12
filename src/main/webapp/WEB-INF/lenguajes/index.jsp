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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
<script>
$(document).ready(function() {
    $('#tabla').DataTable( {
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }
    } );
} );
</script>

<title>Lenguajes</title>
</head>
<body>
	<h1 class="text-center">Lenguajes guardados</h1>
    <div class="container-fluid col-10">
        <div class="col-12">
            <table class="table table-dark table-stripped" id="tabla">
                <thead class="thead-light">
                    <tr>
                        <th>Nombre</th>
                        <th>Creador</th>
                        <th>Version</th>
                        <th></th>
                        <th></th>
                        <th><a class="btn btn-warning text-light" href="/lenguajes/new"><svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-file-earmark-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M9 1H4a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h5v-1H4a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h5v2.5A1.5 1.5 0 0 0 10.5 6H13v2h1V6L9 1z"/>
  <path fill-rule="evenodd" d="M13.5 10a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
  <path fill-rule="evenodd" d="M13 12.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0v-2z"/>
</svg>Nuevo</a></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${lenguajes}" var ="lengTabla">
                        <tr>
                            <td><c:out value="${lengTabla.nombre}"/></td>
                            <td><c:out value="${lengTabla.creador}"/></td>
                            <td><c:out value="${lengTabla.version}"/></td>
                            <td><a class="btn btn-primary btn-sm" href="/lenguajes/<c:out value='${lengTabla.id}'/>">Ver</a></td>
                            <td><a class="btn btn-success btn-sm" href="/lenguajes/<c:out value='${lengTabla.id}'/>/editar">Editar</a></td>
                            <td><form  method="post" action="/lenguajes/<c:out value="${lengTabla.id}"/>">
						       <input type="hidden" name="_method" value="delete">
						       	<input type="submit" value="Eliminar" class="btn btn-sm btn-danger">
						       </form> </td>
                            
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        	
        </div>        
    </div>

</body>
</html>