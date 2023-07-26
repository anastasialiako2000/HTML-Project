<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="routePlanning_classes.*"%>

<% if ((User)session.getAttribute("userObj")==null) {
   
    request.setAttribute("error", "Παρουσιάστηκε σφάλμα."); %> 
    <jsp:forward page="login.jsp" />  

<% } else { %>

<!DOCTYPE html>
<html lang="en">
<title>Route Planning - Επεξεργασία πελατών</title>
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

    #first {
        width: 565px;
        float: left;
        height: 400px;
    }

    #second {
        width: 565px;
        float: left;
        height: 400px;
    }

    .main-label {
        font-size: 16px;
    }

    hr {
        width: 90%;
    }

    body {
        text-align: center;
    }
    
</style>
</head>


<body>
    <div class="container" role="main" style="min-height: 91vh; padding-bottom: 36px;">
        <h1 class="page-header">Eπεξεργασία στοιχείων πελατών</h1>

        <% if(request.getAttribute("posmessage")!=null) { %>
            <div class="alert alert-success alert-dismissible" role="alert">
                <%=(String)request.getAttribute("posmessage") %>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
            </div>
		<% }
        
        if(request.getAttribute("negmessage") !=null) { %>
			<div class="alert alert-danger alert-dismissible" role="alert">
                <%=(String)request.getAttribute("negmessage") %>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
            </div>
		<% } %>

        <div id="first">
            <form method="POST" action="clientFormController.jsp" style="margin-left: 7%;">
                <h3 style="text-align: center;">Εισαγωγή πελατών</h3>

                <br>
                <% if(request.getAttribute("message1") !=null) { %>
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <%=(String)request.getAttribute("message1") %>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                    </div>
                <% } %>


            <div class="form-group row">
                <label for="clientName" class="col-sm-2 col-form-label" style="margin-left: 20%;">Επωνυμία Επιχείρησης</label>
                <div class="col-sm-10" style="width: 200px;">
                <input type="text" id="Επωνυμία" name="clientName" class="form-control" style="width: 300px; margin-left: 22%;"
                    name="Επωνυμία" required>
                </div>
                </div>

                <br> 
                <div class="form-group row">
                <label for="clientAddress" class="col-sm-2 col-form-label" style="margin-left: 20%;"> Οδός (Επιχείρησης)</label>
                <div class="col-sm-10" style="width: 200px;">
                <input type="text" class="form-control" id="client" name="clientRoad" style="width: 300px; margin-left: 22%;"
                    name="Διεύθυνση 1" required>
                </div>
            </div>

                <br>
                <div class="form-group row">
                <label for="clientAddress" class="col-sm-2 col-form-label" style="margin-left: 20%;">Αριθμός (Επιχείρησης)</label>
                <div class="col-sm-10" style="width: 200px;">
                <input type="text" class="form-control" id="clientNumber" name="clientNumber" style="width: 300px; margin-left: 22%;"
                    name="Διεύθυνση 1" required>
                </div>
                </div>


                <br>
                <div class="form-group row">
                <label for="clientAddress" class="col-sm-2 col-form-label" style="margin-left: 20%;">ΤΚ (Επιχείρησης)</label>
                <div class="col-sm-10" style="width: 200px;">
                <input type="text" class="form-control" id="clientTK" name="clientTK" style="width: 300px; margin-left: 22%;"
                    name="Διεύθυνση 1" required>
                </div>
                </div>

                <br>
                <div class="form-group row">
                <label for="clientAddress" class="col-sm-2 col-form-label" style="margin-left: 20%;">Πόλη (Επιχείρησης)</label>
                <div class="col-sm-10" style="width: 200px;">
                <input type="text" class="form-control" id="clientTown" name="clientTown" style="width: 300px; margin-left: 22%;"
                    name="Διεύθυνση 1" required>
                </div>
                </div>


                <br>
                <div class="form-group row">
                <label for="clientWarehouse" class="col-sm-2 col-form-label" style="margin-left: 20%;">Οδός (Αποθήκης)</label>
                <div class="col-sm-10" style="width: 200px;">
                <input type="text" class="form-control" id="clientWarehouseRoad" name="clientWarehouseRoad" style="width: 300px; margin-left: 22%;"
                    name="Διεύθυνση 2" required>
                </div>
                </div>
        
                <br>

                <div class="form-group row">
                <label for="clientWarehouse" class="col-sm-2 col-form-label" style="margin-left: 20%;">Aριθμός (Αποθήκης)</label>
                <div class="col-sm-10" style="width: 200px;">
                <input type="text" class="form-control" id="clientWarehouseNumber" name="clientWarehouseNumber" style="width: 300px; margin-left: 22%;"
                    name="Διεύθυνση 2" required>
                </div>
                </div>


                <br>
                <div class="form-group row">
                <label for="clientWarehouse" class="col-sm-2 col-form-label" style="margin-left: 20%;">ΤΚ (Αποθήκης)</label>
                <div class="col-sm-10" style="width: 200px;">
                <input type="text" class="form-control" id="clientWarehouseTK" name="clientWarehouseTK" style="width: 300px; margin-left: 22%;"
                    name="Διεύθυνση 2" required>

                <br>
                <div class="form-group row">
                <label for="clientWarehouse" class="col-sm-2 col-form-label" style="margin-left:20%;">Πόλη (Αποθήκης)</label>
                <div class="col-sm-10" style="width: 200px;">
                <input type="text" class="form-control" id="clientWarehouseTown" name="clientWarehouseTown" style="width: 300px; margin-left: 22%;"
                    name="Διεύθυνση 2" required>
                </div>
                </div>

                <br>
                <br>
                <div class="form-group">
                        <button type="submit" class="btn btn-success" name="addClient">
                            <span class="glyphicon glyphicon-ok"></span> Εισαγωγή
                        </button>
                        <button type="reset" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> Ακύρωση
                        </button>
                </div>
            </form>
        </div>

        <div id="second">

            <form method="POST" action="clientFormController.jsp" style="margin-right: 7%;">
                <h3 style="text-align: center;">Διαγραφή πελατών</h3>
                <br>
                <% if(request.getAttribute("message2") !=null) { %>
                    <div class="alert alert-danger alert-dismissible" role="alert" style="height: min-content;">
                        <%=(String)request.getAttribute("message2") %>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                    </div>
                <% } %>
                <label for="clientName2">Επωνυμία Επιχείρησης</label>
                <input type="text" id="clientName2" class="form-control" name="clientName2"
                    style="width: 300px; margin-left: 22%;">
                <br>
                <br>
                <div class="form-group">
                    <button type="submit" class="btn btn-success" name="deleteClient">
                        <span class="glyphicon glyphicon-ok"></span> Διαγραφή
                    </button>
                    <button type="reset" class="btn btn-danger">
                        <span class="glyphicon glyphicon-remove"></span> Ακύρωση
                    </button>
            </div>
            </form>
        </div>
    </div>

    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <div class=container style="text-align: center; margin-bottom: 3%; margin-block-start: 1.5%;">
        <a href="menu.jsp" class="button btn btn-info" type="button" style="width: 250px; font-size: medium;">Αποθήκευση αλλαγών</a>
    </div>

</body>

<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
<!-- jQuery library -->
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>

</html>

<% } %>