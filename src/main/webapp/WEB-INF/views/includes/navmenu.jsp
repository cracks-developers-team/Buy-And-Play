<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page contentType="text-html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<spring:url value="/" var="urlRoot"></spring:url>
<!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
          
          <!-- Menu para usuario anonimo -->
      <sec:authorize access="isAnonymous()">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${urlRoot}">Buy && Play</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="${urlRoot}formLogin">Login</a></li> 
            <li><a href="${urlRoot}users/signin">Registrate</a></li> 
          </ul>
        </div><!--/.nav-collapse -->
        </sec:authorize>
        
        <!-- Menu para cliente -->
      <sec:authorize access="hasAnyAuthority('CLIENTE')">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${urlRoot}">Buy && Play</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">   
            <li><a href="${urlRoot}orders/mispedidos">Mis pedidos</a></li>   
            <li><a href="${urlRoot}user/Logout">Logout</a></li>            
          </ul>
        </div><!--/.nav-collapse -->
        </sec:authorize>
        
        <!-- Menu para administrador -->
      <sec:authorize access="hasAnyAuthority('ADMINISTRACION')">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${urlRoot}">Buy && Play</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="${urlRoot}games/indice">Videojuegos</a></li>
            <li><a href="${urlRoot}banners/index">Banners</a></li>   
            <li><a href="${urlRoot}user/Logout">Logout</a></li>            
          </ul>
        </div><!--/.nav-collapse -->
        </sec:authorize>
        
      </div>
    </nav>
