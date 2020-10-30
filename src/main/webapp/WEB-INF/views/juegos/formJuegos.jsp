<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
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

        <form action="${urlRoot}games/save" method="post" enctype="multipart/form-data">
        <div class="row">
          <div class="col-sm-3">
            <div class="form-group">
              <label for="titulo">Título</label>
              <input type="text" class="form-control" name="titulo" id="titulo" required="required" />
            </div>  
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="genero">Descripcion</label>
              <input type="text" class="form-control" name="descripcion" id="descripcion" required="required" />
            </div>  
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="lanzamiento">Año de lanzamiento</label>
              <input type="text" class="form-control" name="lanzamiento" id="lanzamiento" required="required" />
            </div>  
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="categoria" class="control-label">Categoria</label>              
              <select id="categoria" name="categoria" class="form-control">
                <option value="Accion">Accion</option>
                <option value="Aventura">Aventura</option>
                <option value="Carreras">Carreras</option>                  
              </select>             
            </div> 
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="desarrollador">Desarrollado por:</label>
              <input type="text" class="form-control" name="creador" id="creador" required="required" />
            </div>  
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="precio">Precio</label>
              <input type="text" class="form-control" name="precio" id="precio" required="required" />
            </div>  
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="stock">Cant.piezas</label>
              <input type="text" class="form-control" name="stock" id="stock" required="required" />
            </div>  
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="idconsola" class="control-label">Consola</label>              
              <select id="idconsola" name="idconsola" class="form-control">
                <option value="1">Play Station 4</option>
                <option value="2">Play Station 3</option>
                <option value="3">Xbox One</option>                  
              </select>             
            </div> 
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="imagen">Imagen</label>
              <input type="file" id="archivoImagen" name="archivoImagen" />
              <p class="help-block">Imagen de la pelicula</p>
            </div> 
          </div>
        </div>

        <!--  
          <div class="col-sm-6">
            <div class="form-group">
              <label for="trailer">URL del Trailer (Youtube)</label>
              <input type="text" class="form-control" name="trailer" id="trailer" placeholder="URL completa del video de YOUTUBE" required="required" />
            </div>  
          </div> 
        </div> 
        -->
        
        <button type="submit" class="btn btn-danger" >Guardar</button>
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
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
      $(function () {
          $("#fechaEstreno").datepicker({dateFormat: 'dd-mm-yy'});
        }
      );
    </script>
  </body>
</html>
