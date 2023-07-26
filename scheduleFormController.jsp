<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="routePlanning_classes.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>


<% if ((User)session.getAttribute("userObj")==null) {
   
    request.setAttribute("error", "Παρουσιάστηκε σφάλμα."); %> 

    <jsp:forward page="login.jsp" />  

<% } else { %>

    <!DOCTYPE html>
    <html lang="en">

    <% ClientMethods cm = new ClientMethods();
    User user = (User)session.getAttribute("userObj");
    List<Client> clients = cm.getClients(user.getUserName());
    

    try {
        String [] qunew = new String[100];
        String [] qu = request.getParameterValues("quant");
        for ( int k = 0; k<qu.length; k++) {
            if( qu[k]!= null) {
                qunew[k] = qu[k];
            }
        }
        String [] cl = request.getParameterValues("clients");


        for (int j=0; j < cl.length; j++) {
            if (Double.parseDouble(qunew[j]) <=0 || qunew[j] == null){
                request.setAttribute("message", "Η ζητούμενη ποσότητα κάθε πελάτη πρέπει να είναι μεγαλύτερη του 0."); %>
                <jsp:forward page="scheduleForm.jsp"/>
            <% }
        }

        String t = request.getParameter("tracks");
        int trucks = Integer.parseInt(t);
        String c = request.getParameter("capacity");
        double capacity = Double.parseDouble(c);
        if(trucks <= 0) {
            request.setAttribute("message", "Ο αριθμός των φορτηγών πρέπει να είναι μεγαλύτερος του 0."); %>
            <jsp:forward page="scheduleForm.jsp"/>
        <%}
        if ( capacity <= 0 ) {
            request.setAttribute("message", "H χωρητικότητα που εισάγεται πρέπει να είναι μεγαλύτερη του 0."); %>
            <jsp:forward page="scheduleForm.jsp"/>
        <%} %>

        <head>
            <title>Route Planning - Πρόγραμμα δρομολογίων</title>
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
                    width: 350px;
                    float: left;
                    height: 500px;
                }
        
                #second {
                    width: 750px;
                    float: left;
                    height: 500px;
                }
        
                form {
                    max-width: 600px;
                }
        
                .main-label {
                    font-size: 16px;
                }
        
                .mapouter {
                    position: relative;
                    text-align: center;
                    height: 480px;
                    width: 750px;
                    margin-top: 20px;
                }
        
                .gmap_canvas {
                    overflow: hidden;
                    background: none !important;
                    height: 480px;
                    width: 730px;
                }
        
                p {
                    text-align: center;
                }
        
                dd {
                    color: darkgrey;
                }
        
                hr {
                    width: 90%;
                }
            </style>
        </head>

        <%SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();  %>
        <body>
            <div class="container">
                <div class="container theme-showcase" style="text-align: center; margin-top: 2%;">
                    <h1>Πρόγραμμα δρομολογίων επιχείρησης <%=user.getCompanyName()%> για <%=df.format(date) %></h1>
                </div>
            </div>
        
            <hr>
        
            <div class="container">
                <div id="first">
                    <dl style="text-align: center;">
                        <div style="text-align: center;">
                            <h2>Δρομολόγιο φορτηγού 1</h2>
                            <br>
                            <% for(int j = 0; j< cl.length; j++) {
                                if (cl[j] != null) {
                                    cl[j] = new String(cl[j].getBytes("ISO-8859-1"), "UTF-8"); 
                                } %>
                                <dt><b><%=cl[j]%> </b></dt>
                                <dd>Διεύθυνση πελάτη: <%=cm.getClientsAddress(user.getUserName(),cl[j])%> </dd>
                                <% if(j< cl.length-1) { %>
                                    <p>&#8595;</p>
                                <%}
                            } %> 


                        </div>
                    </dl>
                </div>
                <div id="second">
                    <div class="mapouter">
                        <div class="gmap_canvas">
                            <iframe width="700" height="480" id="gmap_canvas"
                                src="https://maps.google.com/maps?q=%CE%9F%CE%B9%CE%BA%CE%BF%CE%BD%CE%BF%CE%BC%CE%B9%CE%BA%CF%8C%20%CE%A0%CE%B1%CE%BD%CE%B5%CF%80%CE%B9%CF%83%CF%84%CE%AE%CE%BC%CE%B9%CE%BF%20%CE%91%CE%B8%CE%B7%CE%BD%CF%8E%CE%BD&t=&z=13&ie=UTF8&iwloc=&output=embed"
                                frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
                
            <br>
            <hr>
        
            <div class=container style="text-align: center; margin-bottom: 3%;">
                <p>Τελική απόσταση που θα διανυθεί: 40 χλμ</p>
                <p>Κατ' εκτίμηση έξοδα σε καύσιμα: 20 &euro;</p>
                <br>
                <a class="btn btn-info" role="button">Αποθήκευση</a>
                <a class="btn btn-info" role="button">Εκτύπωση</a>
            </div>
        </body>

    <% } catch(Exception e) {

        request.setAttribute("message", "Παρακαλώ ελέγξτε τα δεδομένα που έχετε εισάγει."); %>
        <jsp:forward page="scheduleForm.jsp"/>
    
    <% } %>

<% } %>

