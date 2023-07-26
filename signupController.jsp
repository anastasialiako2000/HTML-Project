<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="routePlanning_classes.*"%>

<!DOCTYPE html>
<html lang="en">

<%
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String address = request.getParameter("address");
String username = request.getParameter("username");
String password = request.getParameter("password");
String password_con = request.getParameter("confirm");


int countErrors = 0;

// convert to UTF-8 to support Greek characters
if (name != null) {
	name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
}
if (address != null) {
	address = new String(address.getBytes("ISO-8859-1"), "UTF-8");
}
if (username != null) {
	username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
}

      
String [] errors = new String[100];

try {
    
// email address validation
String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
java.util.regex.Matcher m = p.matcher(email);
	
if( !m.matches() ) {
        request.setAttribute("m1", "Το email δεν είναι αποδεκτό.");		
	countErrors++;
}


//password
if (password.length() < 6) {
        request.setAttribute("m2", "Ο κωδικός πρέπει να αποτελείται από τουλάχιστον 6 χαρακτήρες.");
        countErrors++;
}

//confirm password
if (!(password.equals(password_con)) || password_con == null) {
        request.setAttribute("m3", "Οι κωδικοί που εισάγατε δεν ταιριάζουν.");
        countErrors++;
}

// phone
if (phone.length() < 9) {
        request.setAttribute("m4", "Το τηλέφωνο πρέπει να αποτελείται από 10 ψηφία.");
        countErrors++;
}
     



if (countErrors == 0) {   

        User user = new User(name, phone, email, address, username, password);
        UserMethods u = new UserMethods();
        u.register(user); 
               
        request.setAttribute("posmessage", "Ο χρήστης με το όνομα " + username + " εγγράφηκε επιτυχώς!"); %>

        <jsp:forward page="login.jsp" />

<% } else { %>

        <jsp:forward page="signup.jsp" />   

<% } 
      

} catch(Exception e) {
        request.setAttribute("negmessage", e.getMessage()); %>
        
        <jsp:forward page="signup.jsp" />  

<% } %>