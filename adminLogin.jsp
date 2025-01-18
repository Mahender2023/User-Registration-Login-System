<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
      <link rel="stylesheet"  href="NewFile.css">
</head>
<body>
    <body>
    <div class="container">
        <h1>Admin Login</h1>
        <form action="AdminServlet" method="post">
            <div class="form-row">
                <label for="userName">UserName:</label>
                <input type="text" id="userName" name="userName" required>
            </div>
            <div class="form-row">
                <label for="password">Password:</label>
                <input type="password" id="password" name="Password" required>
            </div>
            <button type="submit" name="action" value="login">Login</button>
            <a href="home.jsp">Home</a>
        </form>
    </div>
</body>

</body>

</html>