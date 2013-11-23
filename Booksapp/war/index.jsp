<%@page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Authentification</title>
   

    <!-- Le styles -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <style>
      body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
      }
    </style>
    <link href="resources/css/bootstrap-responsive.css" rel="stylesheet">

   
  </head>

  <body>
  <% UserService userService = UserServiceFactory.getUserService();
    String thisURL = request.getRequestURI();
    
  %>
       <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
      
          <a class="brand" href="index.jsp">DevFest Insat 2013 </a>
          <div class="nav-collapse collapse">
          </div>
        </div>
      </div>
    </div>


      <div class="container" align="center"  style="margin-top: 40px">

      <form action="guest" method="post" class="form-signin">
      <h2 class="form-signin-heading">Authentification</h2>
      <% if(request.getAttribute("msg")!=null) { %>
       <span style="color: red"> <%=request.getAttribute("msg") %></span>
       <% } %>
      <input type="text" name="login" 
               required="" class="input-block-level" placeholder="Login (guest)">
        <input type="password"
               required="" name="pwd" class="input-block-level" placeholder="Password (guest)">

        <div style="margin-bottom: 10px">
            <button class="btn btn-large btn-primary"  type="submit">Sign In</button>
            <button class="btn btn-large btn-primary btn2" type="reset">Reset</button>
        </div>
     
      </form>
     <a style="margin-left: 50%" href="login" class="google-button"></a>
   
    </div> 
    <footer style="text-align: center;margin-top: 10%"> <a  href="https://appengine.google.com/" > <img src="https://developers.google.com/appengine/images/appengine-silver-120x30.gif" 
alt="Powered by Google App Engine" /></a>
    </footer>
  </body>
</html>