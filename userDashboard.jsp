<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Get the session object
    HttpSession Session = request.getSession();
    
    // Retrieve user details from the session
    String firstName = (String) Session.getAttribute("firstName");
    String lastName = (String) Session.getAttribute("lastName");
    String email = (String) Session.getAttribute("email");
    String phone = (String) Session.getAttribute("phone");
    String date = (String) Session.getAttribute("date");
    String pincode = (String) Session.getAttribute("pincode");  // Correct case
    String address = (String) Session.getAttribute("address");  // Correct case
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
</head>
<body>
    <h1>Welcome, <%= firstName %> <%= lastName %>!</h1>
    <h2>Your Details:</h2>
    <ul>
        <li>Email: <%= email %></li>
        <li>Phone: <%= phone %></li>
        <li>Date: <%= date %></li>
        <li>Pincode: <%= pincode %></li>  <!-- Corrected variable name -->
        <li>Address: <%= address %></li>  <!-- Corrected variable name -->
    </ul>
    <a href="Logout.jsp">Logout</a>
</body>
</html>
