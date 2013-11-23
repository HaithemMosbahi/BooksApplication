<%@page import="com.devfest.model.Person"%>
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
   <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
      
          <a class="brand" href="books.jsp">DevFest Insat 2013 </a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="books">Books</a></li>
              <li><a href="addBook.jsp">Add book</a></li>
               <li><a href="about.jsp">About</a></li>
            </ul>
                 <div style="margin-left: 75%">
                  <ul  class="nav">
                  <li  class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=u.getEmail() %><b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="addBook.jsp">New Book</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=userService.createLogoutURL("/signout")%>">Sign out</a></li>
                  </ul>
                </li></ul>
              </div>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    
    </body></html>