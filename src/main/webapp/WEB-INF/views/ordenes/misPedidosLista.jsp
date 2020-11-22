<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <spring:url value="/games/edit" var="urlEdit"></spring:url>
        <spring:url value="/games/delete" var="urlDelete"></spring:url>
        <spring:url value="/" var="urlRoot"></spring:url>
        <link href="${urlResources}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${urlResources}/bootstrap/css/theme.css" rel="stylesheet">

    </head>

    <body>

        <!-- Fixed navbar -->
        <jsp:include page="../includes/navmenu.jsp"></jsp:include>

            <div class="container theme-showcase" role="main">

                <h3>Todos mis pedidos</h3>

            <c:if test="${mensaje != null}">
                <div class="alert alert-success" role="alert">
                    ${mensaje}
                </div>
            </c:if>

            <div class="table-responsive">
                <table class="table table-hover table-striped table-bordered">
                    <tr>
                        <th>Orden</th>
                        <th>Producto</th>
                        <th>Direccion de entrega</th>
                        <th>Forma de pago</th>
                        <th>Fecha</th>
                        <th>Opciones</th>
                    </tr>
                    <c:forEach items="${ordenes}" var="orden">
                        <tr>
                            <td>${orden.id}</td>
                            <c:forEach items="${juegos}" var="juego">
                                <c:if test="${orden.prodid == juego.id}">
                                    <td>${juego.titulo}</td>
                                </c:if>
                            </c:forEach>
                            <td>${orden.direccion_entrega}</td>
                            <td>${orden.tipo_pago}</td>
                            <td>
                                <fmt:formatDate value="${orden.fecha_pago}" pattern="dd-MM-yyy"></fmt:formatDate>
                                </td>
                                <td>
                                    <a href="${urlRoot}orders/detalle/${orden.id}" class="btn btn-primary" role="button" title="Detalles" >Detalles</a>
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
