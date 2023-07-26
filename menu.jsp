<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="routePlanning_classes.*"%>

<% if ((User)session.getAttribute("userObj")==null) {
   
    request.setAttribute("error", "Παρουσιάστηκε σφάλμα."); %> 
    <jsp:forward page="login.jsp" />  

<% } else { %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Route Planning - Μενου επιλογών</title>
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
            filter: brightness(70%)
            opacity(0.5)
        }

        a:link,
        a:visited {
            color: white;
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

    <div class="container" role="main" style="min-height: 91vh; padding-bottom: 36px;">
        <h1 class="page-header">Μενού Επιλογών</h1>
        <br>
        <div style="font-size: large; text-align: center; width: 500px; margin-left: 28%;">
            Eπιλέξτε μία από τις παρακάτω
            λειτουργίες
        </div>
        <br>
        <a href="clientForm.jsp"  class="btn btn-success" type="button" style="width: 500px;
        height: 90px;">
            <p style="margin-top: 5%; font-size: large;">Eπεξεργασία στοιχείων πελατών</p>
        </a>
        <br><br>
        <a href="scheduleForm.jsp"  class="btn btn-success" type="button" style="width: 500px; 
        height: 90px;">
            <p style="margin-top: 5%; font-size: large;">Έκδοση προγράμματος δρομολογίων</p>
        </a>
    </div>


</body>

</html>


<% } %>