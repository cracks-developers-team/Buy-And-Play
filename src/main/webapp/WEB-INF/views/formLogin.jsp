<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Login</title>
        <spring:url value="/resources" var="urlResources"/>
        <spring:url value="/" var="urlRoot"/>
        <link href="${urlResources}/bootstrap/css/bootstrap.min.css" rel="stylesheet">    
        <link href="${urlResources}/bootstrap/css/theme.css" rel="stylesheet">
        <link href="${urlResources}/bootstrap/css/signin.css" rel="stylesheet">

    </head>

    <body>

        <!-- Fixed navbar -->
        <jsp:include page="includes/navmenu.jsp"></jsp:include>

            <div class="container theme-showcase" role="main">
                <hr class="featurette-divider">
                <img src="${urlResources}/images/login.png" width="136" height="136" class="center"/>

            <form class="form-signin" action="${urlRoot}login" method="post">  

                <c:if test="${param.error != null}">
                    <img src="${urlResources}/images/error.png" width="48" height="48" class="center"/>
                    <h4 class="form-signin-heading" style="color:red">Acceso denegado: Usuario y/o contraseña incorrectos</h4>
                </c:if>

                <h3 class="form-signin-heading">Buy & Play</h3>        
                <label for="username" class="sr-only">Usuario</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Usuario" required autofocus>
                <label for="password" class="sr-only">Contraseña</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <div class="row">
                    <div class="col-lg-6"><button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button></div>
                    <div class="col-lg-6"><a href="${urlRoot}users/signin"" class="btn btn-lg btn-success btn-block">Registrarse</a></div>
                </div>
            </form>

        </div> <!-- /container -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="${urlResources}/bootstrap/js/bootstrap.min.js" ></script>
    </body>
</html>
