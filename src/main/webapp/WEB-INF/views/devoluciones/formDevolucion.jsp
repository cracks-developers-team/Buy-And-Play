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
        <title>Creacion de Peliculas</title>
        <spring:url value="/resources" var="urlResources"/>
        <spring:url value="/refund/send" var="urlSend"/>

        <link href="${urlResources}/bootstrap/css/bootstrap.min.css" rel="stylesheet">    
        <link href="${urlResources}/bootstrap/css/theme.css" rel="stylesheet">
        <link rel="${urlResources}/stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    </head>

    <body>

        <!-- Fixed navbar -->
        <jsp:include page="../includes/navmenu.jsp"></jsp:include>
            <div class="container theme-showcase" role="main">

                <div class="page-header">
                    <h3 class="blog-title"><span class="label label-success">Solicitud de devolucion</span></h3>
                </div>
            <c:if test="${mensaje != null}">
                <div class="alert alert-warning" role="alert">
                    ${mensaje}
                </div>
            </c:if>

            <form:form action="${urlSend}" method="post" enctype="multipart/form-data" modelAttribute="solicitud">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="imagen">Imagen</label>
                            <input type="file" id="archivoImagen" name="archivoImagen" />
                            <p class="help-block">Imagen de la pelicula</p>
                        </div> 
                    </div>
                    <div class="col-sm-1">
                        <div class="form-group">
                            <label for="idOrden">Id de la orden</label>
                            <form:input type="text" class="form-control" path="idOrden" id="idOrden" required="required" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="descripcion">Descripcion</label>
                                <form:textarea class="form-control" rows="5" path="sol_desc" id="descripcion"></form:textarea>
                                </div> 
                            </div> 
                        </div>


                        <button type="submit" class="btn btn-danger" >Guardar</button>
                </form:form> 

                <hr class="featurette-divider">

                <!-- FOOTER -->
                <jsp:include page="../includes/footer.jsp"></jsp:include>
                </div> <!-- /container -->

                <!-- Bootstrap core JavaScript
                ================================================== -->
                <!-- Placed at the end of the document so the pages load faster -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
                <script src="${urlResources}/bootstrap/js/bootstrap.min.js"></script> 
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
            <script>
                $(function () {
                    $("#fechaEstreno").datepicker({dateFormat: 'dd-mm-yy'});
                }
                );
            </script>
    </body>
</html>
