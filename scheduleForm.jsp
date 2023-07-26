<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="routePlanning_classes.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<% if ((User)session.getAttribute("userObj")==null) {
   
    request.setAttribute("error", "Παρουσιάστηκε σφάλμα."); %> 
    <jsp:forward page="login.jsp" />  

<% } else { 
        ClientMethods cm = new ClientMethods();
        User c = (User)session.getAttribute("userObj");
        List<Client> clients = cm.getClients(c.getUserName()); %>

<!DOCTYPE html>
<html>

<head>
    <title>Route Planning - Εισαγωγή στοιχείων</title>
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

        a:link,
        a:visited {
            color: white;
        }

        form {
            max-width: 600px;
        }

        .main-label {
            font-size: 16px;
        }

        .hidden-textbox {
            visibility: hidden;
        }

        input[type='checkbox']:checked~.hidden-textbox {
            visibility: visible;
        }
        
    </style>
</head>

<body>
    <div class="container" role="main" style="min-height: 91vh; padding-bottom: 36px;">
        <h1 class="page-header" style="text-align: center;">Εισαγωγή στοιχείων για την έκδοση του προγράμματος</h1>

        <% if(request.getAttribute("message") !=null) { %>
            <div class="alert alert-danger alert-dismissible" role="alert" style="text-align: center;">
                <%=(String)request.getAttribute("message") %>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
            </div>
        <% } %>

      

        <div class="container">
            <form id="GFG" method="POST" action="scheduleFormController.jsp">
                <h3>Επιλογή πελατών που θα εξυπηρετηθούν</h3>
                <p>Επιλέξτε από τους πελάτες που έχετε εισάγει στην εφαρμογή μας εκείνους που επιθυμείτε να εξυπηρετήσετε και εισάγετε την εκτιμώμενη ζητούμενη ποσότητα για καθέναν από αυτούς.</p>
                <p>(Οι ποσότητες πρέπει να είναι μεγαλύτερες του 0)</p>
                <div class="form-check">
                    <% for (Client client : clients) { %>
                        <div class="col-sm-offset-1 form-inline form-horizontal" style="font-size:15px;">
                            <label for id="Client" class="checkbox-inline">
                                <input type="checkbox" name="clients" id="Client" value="<%=client.getClientName()%>"><%=client.getClientName()%>
                                <br>
                                <input type="text" name="quant" style="width: 90px;"
                                    class="hidden-textbox form-control" placeholder="Ποσότητα" >
                            </label>
                            <br>
                        </div>
                    <% } %>
                </div>

                <h3>Εισαγωγή στοιχείων σχετικά με τα φορτηγά</h3>

                <!-- number of tracks -->
                <div class="form-group">
                    <label for="tracks" class="control-label main-label">Αριθμός διαθέσιμων φορτηγών </label>
                    <p>Εισάγετε τον αριθμό των φορτηγών που έχει στη διάθεσή της η επιχείρησή σας.</p>
                    <input type="text" name="tracks" id="tracks" class="form-control" style="width: 90px;" required>
                </div>


                <!-- capacity of tracks -->
                <div class="form-group">
                    <label for="capacity" class="control-label main-label">Χωρητικότητα φορτηγών (επιλέξτε μονάδα
                        μέτρησης)</label>
                    <p>Εισάγετε τη χωρητικότητα των φορτηγών της επιχείρησής σας.</p>
                    <p>(Σε ίδια μονάδα μέτρησης θα πρέπει να είναι και η ζήτηση των πελατών)</p>
                    <div class="form-inline">
                        <input type="text" name="capacity" id="capacity" class="form-control" style="width: 90px;" required>
                        <select id="measure" name="measure" class="form-control" style="width: 180px;">
                            <option value="kg">Κιλά</option>
                            <option value="lt">Λίτρα</option>
                            <option value="sqm">Τετραγωνικά μέτρα</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-success" style="font-size: large;" formaction="scheduleFormController.jsp">Έκδοση Προγράμματος Δρομολογίων</button>
                <br>
                </div>


            </form>

        </div>
    </div>
</body>

</html>


<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
<!-- jQuery library -->
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>

</html>

<% } %>