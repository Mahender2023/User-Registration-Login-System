<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link rel="stylesheet" href="NewFile.css">
</head>
<body>
    <div class="container">
    <form class="form-user" action="UserServlet" method="post">
        <h1>User Login</h1>
        
        <div class="form-row">
            <label for="Email">Email:</label>
            <input type="Email" id="Email" name="Email" required>
        </div>
        
        <div class="form-row">
            <label for="Password">Password:</label>
            <input type="Password" id="Password" name="Password" required>
        </div>
        
        <button type="submit" name="action" value="login">Login</button>
        <a href="userRegistration.jsp">New Registration</a>
        <a href="forgotPassword.jsp">Forgot Password?</a>
        <a href="home.jsp">Home</a>
    </form>
</div>
</body>
</html>

