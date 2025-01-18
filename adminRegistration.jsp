<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Registration</title>
    <link rel="stylesheet"  href="NewFile.css">
</head>
<body>
    <div class="container">
        <h1>Admin Registration</h1>
        <form action="AdminServlet" method="post">
            <input type="hidden" name="action" value="register">
            
            <div class="form-row">
                <label for="userName">UserName:</label>
                <input type="text" id="userName" name="userName" required placeholder="Enter your username">
            </div>
            
            <div class="form-row">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required placeholder="Create a password">
            </div>
            
            <button type="submit">Register</button>
            <a href="home.jsp">Home</a>
        </form>
    </div>
</body>

</html>