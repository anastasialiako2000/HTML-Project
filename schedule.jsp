<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="routePlanning_classes.*"%>
<%@ page import = "java.util.*"%>

<% if ((User)session.getAttribute("userObj")==null) {
   
    request.setAttribute("error", "Παρουσιάστηκε σφάλμα."); %> 
    <jsp:forward page="login.jsp" />  

<% } else { %>

<!DOCTYPE html>
<html>

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

<body>
    <div class="container" role="main" style="min-height: 91vh; padding-bottom: 36px;">
        <h1 class="page-header" style="text-align: center;">Πρόγραμμα δρομολογίων επιχείρησης ΑΒΓ για 15/11/2021</h1>

        <% 
        List<ArrayList<String>> routes = new ArrayList<ArrayList<String>>();
        Object array = session.getAttribute("routes");
        routes = (ArrayList<ArrayList<String>>) array;
        %>
       
        <p><%=routes%></p>
        <%for(int i = 0; i<routes.size(); i++){ %>
            <div class="container">
                <div id="first">
                    <dl style="text-align: center;">
                        <div style="text-align: center;">
                            <h2>Δρομολόγιο φορτηγού <%=i+1%> </h2>
                            <% ArrayList<String> ro = routes.get(i);
                             for(int j = 0; j<ro.size(); j++) { %>
                                <dt><b><%=ro.get(j)%> </b></dt>
                                <dd>Διεύθυνση πελάτη: </dd>
                                <% if(j<ro.size()-1) { %>
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
        <%}%>

        <br>
        <hr>

        <div class=container style="text-align: center; margin-bottom: 3%;">
            <p>Τελική απόσταση που θα διανυθεί: xx χλμ</p>
            <p>Κατ' εκτίμηση έξοδα σε καύσιμα: yy &euro;</p>
            <br>
            <a class="btn btn-info" role="button">Αποθήκευση</a>
            <a class="btn btn-info" role="button">Εκτύπωση</a>
        </div>
    </div>
</body>

</html>


<% } %>