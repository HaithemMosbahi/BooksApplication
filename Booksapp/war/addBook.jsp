<%@page import="com.devfest.model.Person"%>
<%@page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@page import="com.google.appengine.api.blobstore.BlobstoreService"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Add book</title>
    
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
<body>
<jsp:include page="header.jsp"></jsp:include>
    <% 
    UserService userService = UserServiceFactory.getUserService();
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
    %>
         <div class="container" style="margin-top: 30px">

      <form action="<%= blobstoreService.createUploadUrl("/addBook") %>" method="post" enctype="multipart/form-data" class="form-signin">
        <h2 class="form-signin-heading">New Book</h2>
      
        <div>
            <input type="text" name="name" 
               required="" class="input-block-level" placeholder="Book Name"/>
               <input type="text" name="author" 
               required="" class="input-block-level" placeholder="Author"/>
            
                    Book Image : <input type="file" name="uploadedImg" >
                    <textarea cols="30" rows="10" name="desc" 
                class="input-block-level" placeholder="Books's Description"></textarea>
        
                    </div>
                     
       
       
        <div style="margin-bottom: 10px">
            <button class="btn btn-large btn-primary" type="submit">Add</button>
            <button class="btn btn-large btn-primary btn2" type="reset">Reset</button>
        </div>
       
      
      </form>

    </div> <!-- /container -->
      
  <script src="http://code.jquery.com/jquery.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    </body>
</html>
   