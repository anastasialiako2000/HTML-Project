<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList"%>
<%@ page import="routePlanning_classes.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Route Planning - Εγγραφή</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

  <!-- Adding some custom style to page -->
  <style type="text/css">
    container {
      width: 1130px;
      margin: auto;
      margin-top: 20px;
    }

    .main-label {
      font-size: 16px;
    }

    hr {
      width: 90%;
    }

    body {
      text-align: center;
      background-image: url("free-green-banner-background-design-images-download-light-green-background.jpg");
    }
    
  </style>
</head>


<body>
  <div class=container role="main" style="min-height: 91vh; padding-bottom: 36px; text-align: center;">
    <h1 class="page-header"> Εγγραφή Χρήστη </h1>
    <div class="alert alert-success" role="alert" style="text-align: center; font-size: large;">Εισάγετε τα στοιχεία της επιχείρησής σας
    </div>
    
    <% if(request.getAttribute("negmessage")!=null) { %>
      <div class="alert alert-danger alert-dismissible" role="alert">
          <%=(String)request.getAttribute("negmessage") %>
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
      </div>
    <% } %>

    <% if(request.getAttribute("m1")!=null) { %>
      <div class="alert alert-danger alert-dismissible" role="alert">
        <%=(String)request.getAttribute("m1")%>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
      </div>
    <% } %>

    <% if(request.getAttribute("m2")!=null) { %>
      <div class="alert alert-danger alert-dismissible" role="alert">
        <%=(String)request.getAttribute("m2")%>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
      </div>
    <% } %>

    <% if(request.getAttribute("m3")!=null) { %>
      <div class="alert alert-danger alert-dismissible" role="alert">
        <%=(String)request.getAttribute("m3")%>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
      </div>
    <% } %>

    <% if(request.getAttribute("m4")!=null) { %>
      <div class="alert alert-danger alert-dismissible" role="alert">
        <%=(String)request.getAttribute("m4")%>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
      </div>
    <% } %>

    <form action="signupController.jsp" method="POST" class="form-horizontal">

      <!-- username -->

      <div class="form-group">
        <label for="name">Επωνυμία</label>
          <input type="text" name="name" id="name" class="form-control" style="width: 300px; margin-left: 37%;" required>
      </div>

      <!-- phone -->
      <div class="form-group">
        <label for="phone">Τηλέφωνο</label>
        <input type="text" name="phone" id="phone" class="form-control" style="width: 300px; margin-left: 37%;"  required> 
      </div>

      <!-- email -->
      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" name="email" id="email" class="form-control" style="width: 300px; margin-left: 37%;" required>
      </div>

      <!-- address -->
      <div style="display:inline-block;">
      <div class="form-group">
        <label for="address">Οδός</label>
        <input type="text" name="addressRoad" id="address" class="form-control" style="width: 170px;" required>
      </div>
     </div>
     <div style="display:inline-block; margin-left: 5%;">
      <div class="form-group">
        <label for="address">Αριθμός</label>
          <input type="text" name="addressNumber" id="address" class="form-control" style="width: 100px;" required>
        </div>
     </div>
     <br>
     <div style="display:inline-block;">
      <div class="form-group">
        <label for="address">Πόλη</label>
        <input type="text" name="addressTown" id="address" class="form-control" style="width: 170px;" required>
      </div>
     </div>
      <div style="display:inline-block; margin-left: 5%;">
      <div class="form-group">
        <label for="address">ΤΚ</label>
        <input type="text" name="addressTK" id="address" class="form-control" style="width: 100px;" required>
      </div>
     </div>

      <!-- username -->
      <div class="form-group">
        <label for="username">Όνομα Χρήστη</label>
        <input type="text" name="username" id="username" class="form-control" style="width: 300px; margin-left: 37%;" required>
      </div>

      <!-- password -->
      <div class="form-group">
        <label for="password">Κωδικός</label>
        <input type="password" name="password" id="password" class="form-control" style="width: 300px; margin-left: 37%;" required>
      </div>

      <!-- confirm password -->
      <div class="form-group">
        <label for="Confirm">Επιβεβαίωση Κωδικού</label>
        <input type="password" name="confirm" id="confirm" class="form-control" style="width: 300px; margin-left: 37%;" required>
      </div>

      <br>

      <!-- buttons -->
      <div class="form-group">
        <button type="submit" class="btn btn-success" style="font-size: large;">Εγγραφή</button>
      </div>

    </form>

  </div>
</body>

</html>