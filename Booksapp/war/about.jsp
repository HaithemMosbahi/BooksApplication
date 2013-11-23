<%@page import="com.devfest.model.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.devfest.model.Book"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Books</title>
   
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
    <% Person u=(Person)session.getAttribute("user");
    UserService userService = UserServiceFactory.getUserService();
    %>
   <jsp:include page="header.jsp"></jsp:include>
    <h3 style="margin-left: 10px">Java web application on google app engine</h3>
    <div class="container" style="margin-top: 10px;margin-left: 30px">
 
  <br/>
  This application uses :
  <ul>
  <li>Google users service to Login with  google account</li>
  <li>DataStore to persist Data</li>
  <li>BlobStore to store uploaded files</li>
  </ul>
  <br/>
  <h3 style="margin-left: 10px"><a href="https://github.com/HaithemMosbahi/BooksApplication">Code source is available on Github</a> </h3>
  </div>
   <script src="http://code.jquery.com/jquery.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    </body>
</html>