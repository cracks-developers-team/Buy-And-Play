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
		<link href="${urlResources}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="${urlResources}/bootstrap/css/theme.css" rel="stylesheet">

	</head>

	<body>

		<!-- Fixed navbar -->
                <jsp:include page="includes/navmenu.jsp"></jsp:include>

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
                                                                        <a href="" class="btn btn-success" role="button" title="Agregar carrito" >Agregar al carrito</a><br><br> 
                                                                        <a href="" class="btn btn-success" role="button" title="Lista de deseos" >Lista de deseos</a><br><br>


								</p> 

							</div>
						</div>                          
					</div>
				</div>

				

				<div class="row">
					<div class="col-sm-7">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Trailer</h3>
							</div>
							<div class="panel-body">
								<iframe width="100%" height="315" src="${juego.url}" >                          
								</iframe>
							</div>
						</div>           
					</div> 
					
				</div>

			</div><!-- /.container -->

			<hr class="featurette-divider">

			<!-- FOOTER -->
                        <jsp:include page="includes/footer.jsp"></jsp:include>

		</div> <!-- /container -->

		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
		<script src="${urlResources}/bootstrap/js/bootstrap.min.js"></script> 
	</body>
</html>
