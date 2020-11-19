<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <meta name="author" content="">
        <title>Registro de Usuarios</title>
        <spring:url value="/resources" var="urlResources"/>
        <spring:url value="/users/save" var="urlSave"/>
        <link href="${urlResources}/bootstrap/css/bootstrap.min.css" rel="stylesheet">    
        <link href="${urlResources}/bootstrap/css/theme.css" rel="stylesheet">
    </head>

    <body>

        <!-- Fixed navbar -->
        <jsp:include page="../includes/navmenu.jsp"></jsp:include>

            <div class="container theme-showcase" role="main">

                <h3 class="blog-title"><span class="label label-success">Datos del Usuario</span></h3>  
                <c:if test="${mensaje != null}">
                <div class="alert alert-success" role="alert">
                    ${mensaje}
                </div>
            </c:if>

            <form:form modelAttribute="usuario" action="${urlSave}" method="post">
                <div class="row"> 	
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>             
                            <form:input type="text" class="form-control" path="nombre" id="nombre" required="required"/>
                        </div>  
                    </div>

                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="apellido">Apellido</label>             
                            <form:input type="text" class="form-control" path="apellido" id="apellido" required="required"/>
                        </div>  
                    </div>         
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label for="sexo" class="control-label">Sexo</label>              
                            <form:select id="sexo" path="sexo" class="form-control">
                                <form:option value="Masculino">Masculino</form:option>
                                <form:option value="Femenino">Femenino</form:option>								
                            </form:select>             
                        </div> 
                    </div>    
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="fechaNacimiento">Fecha de nacimiento</label>             
                            <form:input type="text" class="form-control" path="fecha_nac" id="fechaNacimiento" required="required" placeholder="Dia-Mes-Año -> 1990-10-10"/>
                        </div>  
                    </div>
                </div>

                <div class="row"> 	
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="domicilio">Domicilio</label>             
                            <form:input type="text" class="form-control" path="domicilio" id="domicilio" required="required"/>
                        </div>  
                    </div>

                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="telefono">Telefono</label>             
                            <form:input type="number" class="form-control" path="telefono" id="telefono" required="required"/>
                        </div>  
                    </div>

                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <form:input type="email" class="form-control" path="email" id="email" placeholder="Correo electrónico" required="required"/>
                        </div>  
                    </div>
                </div>

                <div class="row">

                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="username">Username</label>             
                            <form:input type="text" class="form-control" path="username" id="username" required="required"/>
                        </div>  
                    </div>

                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="password">Password</label>             
                            <form:input type="password" class="form-control" path="password" id="password" required="required"/>
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
    </body>
</html>
