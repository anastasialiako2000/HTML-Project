<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="routePlanning_classes.*"%>

<% if ((User)session.getAttribute("userObj")==null) {
   
    request.setAttribute("error", "Παρουσιάστηκε σφάλμα."); %> 
    <jsp:forward page="login.jsp" />  

<% } else { %>

<!DOCTYPE html>
<html lang="en">

<%

User user=(User)session.getAttribute("userObj");
String userName = user.getUserName();

if (request.getParameter("addClient")!=null) {

    String clientName = request.getParameter("clientName");
    String clientRoad = request.getParameter("clientRoad");
    String clientNumber = request.getParameter("clientNumber");
    String clientTK = request.getParameter("clientTK");
    String clientTown = request.getParameter("clientTown");
    String clientWarehouseRoad = request.getParameter("clientWarehouseRoad");
    String clientWarehouseNumber = request.getParameter("clientWarehouseNumber");
    String clientWarehouseTK = request.getParameter("clientWarehouseTK");
    String clientWarehouseTown = request.getParameter("clientWarehouseTown");

    if (clientName != null) {
        clientName = new String(clientName.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (clientRoad != null) {
        clientRoad = new String(clientRoad.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (clientNumber != null) {
        clientNumber = new String(clientNumber.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (clientTK != null) {
        clientTK = new String(clientTK.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (clientTown != null) {
        clientTown = new String(clientTown.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (clientWarehouseRoad != null) {
        clientWarehouseRoad = new String(clientWarehouseRoad.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (clientWarehouseNumber != null) {
        clientWarehouseNumber = new String(clientWarehouseNumber.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (clientWarehouseTK != null) {
        clientWarehouseTK = new String(clientWarehouseTK.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (clientWarehouseTown != null) {
        clientWarehouseTown = new String(clientWarehouseTown.getBytes("ISO-8859-1"), "UTF-8");
    }

    

    
    
  
    try {

        if (clientName.length() == 0 || clientRoad.length() == 0 || clientNumber.length() == 0 || clientTK.length() == 0 || clientTown.length() == 0 || clientWarehouseRoad.length() == 0 || clientWarehouseNumber.length() == 0 || clientWarehouseTK.length() == 0 || clientWarehouseTown.length() == 0) {

                request.setAttribute("message1", "Παρακαλώ εισάγετε όλα τα απαιτούμενα στοιχεία του πελάτη.");

        } else {
            String clientAddress = clientRoad + " " + clientNumber + ", " + clientTown + ", " + clientTK;
            String clientWarehouseAddress = clientWarehouseRoad + " " + clientWarehouseNumber + ", " + clientWarehouseTown + ", " + clientWarehouseTK;
           
            Client client = new Client(clientName, clientAddress, clientWarehouseAddress, userName);
            ClientMethods c = new ClientMethods();
            c.addClient(client);
            request.setAttribute("posmessage", "Ο πελάτης " + clientName + " εισάχθηκε επιτυχώς!");

        }

    } catch(Exception e) {

        request.setAttribute("message1", e.getMessage());

    }

} else if (request.getParameter("deleteClient")!=null) {

    String clientName = request.getParameter("clientName2");

    if (clientName != null) {
        clientName = new String(clientName.getBytes("ISO-8859-1"), "UTF-8");
    }

    try {

        if (clientName.length() == 0) {

            request.setAttribute("message2", "Παρακαλώ εισάγετε την επωνυμία του πελάτη.");
            
        } else {

            ClientMethods c = new ClientMethods();
            c.deleteClient(clientName, userName);
            request.setAttribute("posmessage", "Ο πελάτης " + clientName + " διαγράφηκε επιτυχώς!");

        }

    } catch(Exception e) {

        request.setAttribute("message2", e.getMessage());

    }
    

}
%>

<jsp:forward page="clientForm.jsp"/>


<% } %>