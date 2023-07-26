<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="routePlanning_classes.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">

<%

String userName = request.getParameter("username");
String password = request.getParameter("password");

try {

    UserMethods userm = new UserMethods();
    User user = userm.authenticate(userName, password);
    
    session.setAttribute("userObj", user); %>

    <jsp:forward page="menu.jsp" />  

<% } catch(Exception e) {

    request.setAttribute("negmessage", e.getMessage()); %> 
    <jsp:forward page="login.jsp" />  

<% } %>