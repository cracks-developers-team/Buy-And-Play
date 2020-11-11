<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text-html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">   
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Creacion de Peliculas</title>
        <spring:url value="/resources" var="urlResources"></spring:url>
        <spring:url value="/" var="urlRoot"></spring:url>
        <link href="${urlResources}/bootstrap/css/bootstrap.min.css" rel="stylesheet">    
        <link href="${urlResources}/bootstrap/css/theme.css" rel="stylesheet">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    </head>

    <body>

        <!-- Fixed navbar -->
        <jsp:include page="../includes/navmenu.jsp"></jsp:include>
            <div class="container theme-showcase" role="main">

                <div class="page-header">
                    <h3 class="blog-title"><span class="label label-success">Datos del Videojuego</span></h3>
                </div>
                <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <img src="${urlResources}/images/${juego.portada}"  title="Imagen actual del juego" >
                    </div>  
                </div>
            </div>

            <form:form modelAttribute="juego" action="${urlRoot}games/save" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="titulo">Título</label>
                            <form:hidden path="id"/>
                            <form:input type="text" class="form-control" path="titulo" id="titulo" required="required" />
                        </div>  
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="genero">Descripcion</label>
                            <form:input type="text" class="form-control" path="descripcion" id="descripcion" required="required" />
                        </div>  
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="lanzamiento">Año de lanzamiento</label>
                            <form:input type="text" class="form-control" path="lanzamiento" id="lanzamiento" required="required" />
                        </div>  
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="categoria" class="control-label">Categoria</label>              
                            <form:select id="categoria" path="id_categoria" class="form-control">
                                <form:option value="1">Accion</form:option>
                                <form:option value="2">Aventura</form:option>
                                <form:option value="3">Carreras</form:option>                  
                            </form:select>             
                        </div> 
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="desarrollador">Desarrollado por:</label>
                            <form:input type="text" class="form-control" path="desarrollador" id="creador" required="required" />
                        </div>  
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="precio">Precio</label>
                            <form:input type="text" class="form-control" path="precio" id="precio" required="required" />
                        </div>  
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="stock">Cant.piezas</label>
                            <form:input type="text" class="form-control" path="stock" id="stock" required="required" />
                        </div>  
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="idconsola" class="control-label">Consola</label>              
                            <form:select id="idconsola" path="id_consola" class="form-control">
                                <form:option value="1">Play Station 4</form:option>
                                <form:option value="2">Play Station 3</form:option>
                                <form:option value="3">Xbox One</form:option>                  
                            </form:select>             
                        </div> 
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="imagen">Imagen</label>
                            <input type="file" id="archivoImagen" name="archivoImagen" />
                            <p class="help-block">Imagen de la pelicula</p>
                        </div> 
                    </div>



                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="trailer">URL del Trailer (Youtube)</label>
                            <form:input type="text" class="form-control" path="url" id="trailer" placeholder="URL completa del video de YOUTUBE" required="required" />
                        </div>  
                    </div> 
                </div> 

                <button type="submit" class="btn btn-danger" >Guardar</button>
            </div>

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
