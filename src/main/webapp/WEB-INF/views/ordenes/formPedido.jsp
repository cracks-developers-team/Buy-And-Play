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
        <title>Detalles de la pelicula</title>
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
                        </p>
                    </div>
                    <div class="col-sm-9">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">DETALLES</h3>
                            </div>
                            <div class="panel-body">                           
                                <p>
                                    Título Original : ${juego.titulo} <br>
                                    Descipcion : ${juego.descripcion} <br>
                                    Precio: ${juego.precio} <br>
                                    Categoria: ${juego.categoria.cat_nombre} <br>                  
                                    Año de Estreno: ${juego.lanzamiento} <br>
                                    Calificacion : ${juego.calificacion} <br> <br>
                                </p> 

                            </div>
                        </div>                          
                    </div>
                </div>
            </div><!-- /.container -->

            <form action="${urlRoot}orders/confirm" method="get">
                <div class="row">         
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="direccion">Direccion de entrega</label>             
                            <input type="text" class="form-control" name="direccion" id="direccion" required="required"/>
                        </div>
                    </div>


                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="tipo_pago">Tipo de pago</label>             
                            <select id="tipo_pago" name="tipo_pago" class="form-control">
                                <option value="Tarjeta de credito">Tarjeta de credito</option>
                                <option value="Tarjeta de debito">Tarjeta de debito</option>                
                            </select>  
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary btn-block" >Ordenar</button>
            </form>

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
