<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Listado de solicitudes de devolucion</title>
        <spring:url value="/resources" var="urlResources"/>
        <spring:url value="/refund/detalles" var="urlDetalles"/>
        <link href="${urlResources}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${urlResources}/bootstrap/css/theme.css" rel="stylesheet">

    </head>

    <body>

        <!-- Fixed navbar -->
        <jsp:include page="../includes/navmenu.jsp"></jsp:include>

            <div class="container theme-showcase" role="main">

                <h3>Listado de solicitudes de devolucion</h3>


                <div class="table-responsive">
                    <table class="table table-hover table-striped table-bordered">
                        <tr>
                            <th>Id</th>
                            <th>Descripcion</th>                           
                            <th>Evidencia</th>              
                            <th>Id de la orden</th>
                            <th>Opciones</th>              
                        </tr>
                    <c:forEach items="${devoluciones}" var="devolucion">
                        <tr>
                            <td>${devolucion.sol_id}</td>
                            <td>${devolucion.sol_desc}</td>
                            <td><img class="img-rounded" src="${urlResources}/images/${devolucion.sol_evidencia}" alt="Generic placeholder image" width="100%" height="150" ></td>              
                            <td>${devolucion.idOrden}</td>
                            <td>
                                <a href="${urlDetalles}/${devolucion.sol_id}" class="btn btn-primary" role="button" title="Ver detalles" >Detalles</a>
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
