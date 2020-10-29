<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page contentType="text-html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Listado de Videojuegos</title>
    <spring:url value="/resources" var="urlResources"></spring:url>
    <spring:url value="/" var="urlRoot"></spring:url>
    <link href="${urlResources}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${urlResources}/bootstrap/css/theme.css" rel="stylesheet">

</head>

<body>

    <!-- Fixed navbar -->
    <jsp:include page="../includes/navmenu.jsp"></jsp:include>

        <div class="container theme-showcase" role="main">

            <h3>Listado de Videojuegos</h3>

            <a href="#" class="btn btn-success" role="button" title="Nueva Juego" >Nuevo</a><br><br>

            <div class="table-responsive">
                <table class="table table-hover table-striped table-bordered">
                    <tr>
                        <th>Titulo</th>
                        <th>Genero</th>
                        <th>Precio</th>
                        <th>Año Estreno</th>
                        <th>Stock</th>
                        <th>Opciones</th>
                    </tr>
                    <c:forEach items="${juegos}" var="juego">
                    <tr>
                        <td>${juego.titulo}</td>
                        <td>${juego.categoria}</td>
                        <td>${juego.precio}</td>
                        <td>${juego.lanzamiento}</td>
                        <td>${juego.stock}</td>
                        <td>
                            <a href="#" class="btn btn-success btn-sm" role="button" title="Edit" ><span class="glyphicon glyphicon-pencil"></span></a>
                            <a href="#" class="btn btn-danger btn-sm" role="button" title="Eliminar" ><span class="glyphicon glyphicon-trash"></span></a>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>

        <hr class="featurette-divider">

        <!-- FOOTER -->
        <jsp:include page="../includes/footer.jsp"></jsp:include>

        </div> <!-- /container -->

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
        <script src="${urlResources}/bootstrap/js/bootstrap.min.js"></script>     
</body>
</html>
