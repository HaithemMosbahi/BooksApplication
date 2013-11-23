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
   <jsp:include page="header.jsp"></jsp:include>
    
    <% List<Book> books=(ArrayList<Book>)request.getAttribute("allbooks");
    %>
   
    
  <ul class="thumbnails" style="margin-left: 5px;margin-right: 5px">
   <% if(!books.isEmpty()) {  
   for(int i=0;i<books.size();i++) { %>
  <li class="span4" >
    <div class="thumbnail">
      <img src="<%=books.get(i).getUrlImg() %>" class="img-rounded">
      <h4 align="center"><%=books.get(i).getName() %></h4>
      <b>Description:</b>
      <p style="background-color: white;padding:10px 10px 10px 10px"><%=books.get(i).getDescription()%></p>
    </div>
  </li>
   <% }
   } else { %>
   <br/>
   <h2>There's No Books available ! <a href="addBook.jsp"> Add New Book</a></h2>
   <% } %>
</ul>

   <script src="http://code.jquery.com/jquery.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    </body>
</html>