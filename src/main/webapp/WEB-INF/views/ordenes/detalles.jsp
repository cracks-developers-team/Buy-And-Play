<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Detalles del pedido</title>
        <spring:url value="/resources" var="urlResources"></spring:url>
        <spring:url value="/" var="urlRoot"></spring:url>
        <link href="${urlResources}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${urlResources}/bootstrap/css/theme.css" rel="stylesheet">

    </head>

    <body>

        <!-- Fixed navbar -->
        <jsp:include page="../includes/navmenu.jsp"></jsp:include>

            <div class="container theme-showcase" role="main">

                <!-- Marketing messaging -->
                <div class="container marketing">

                    <div class="page-header">
                        <h2>${juego.titulo}</h2>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <p class="text-center">
                            <img class="img-rounded" src="${urlResources}/images/${juego.portada}" alt="Generic placeholder image" width="155" height="220">  
                            <br><br><a href="${urlRoot}orders/detalle/${orden.id}" class="btn btn-danger" role="button" title="PDF" >Descargar PDF</a>          
                        </p>
                    </div>
                    <div class="col-sm-9">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">DETALLES DEL PEDIDO</h3>
                            </div>
                            <div class="panel-body">                           
                                <p>
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped table-bordered">
                                        <tr>
                                            <th>Cliente: ${usuario.nombre} ${usuario.apellido}</th>
                                        </tr>

                                        <tr>
                                            <th>Domicilio del cliente: ${usuario.domicilio}</th>
                                        </tr>

                                        <tr>
                                            <th>Telefono: ${usuario.telefono}</th>
                                        </tr>

                                        <tr>
                                            <th>Correo electronico: ${usuario.email}</th>
                                        </tr>

                                        <tr>
                                            <th>No.Pedido: ${orden.id}</th>
                                        </tr>

                                        <tr>
                                            <th>Producto: ${juego.titulo}</th>
                                        </tr>

                                        <tr>
                                            <th>Precio: ${juego.precio}</th>
                                        </tr>

                                        <tr>
                                            <th>Cantidad: ${orden.cantidad}</th>
                                        </tr>

                                        <tr>
                                            <th>Total de la compra: ${juego.precio}</th>
                                        </tr>

                                        <tr>
                                            <th>Direccion de entrega: ${orden.direccion_entrega}</th>
                                        </tr>

                                        <tr>
                                            <th>Tipo de pago: ${orden.tipo_pago}</th>
                                        </tr>

                                        <tr>
                                            <th>Fecha: <fmt:formatDate value="${orden.fecha_pago}" pattern="dd-MM-yyyy"></fmt:formatDate></th>
                                            </tr>
                                        </table>
                                    </div>
                                    </p> 

                                </div>
                            </div>                          
                        </div>
                    </div>





                </div><!-- /.container -->

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
