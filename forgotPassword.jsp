<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
</head>
<body>
    <h2>Forgot Password</h2>
    <form action="UserServlet" method="post"> <!-- Updated action -->
        <input type="hidden" name="action" value="forgotPassword">
        <label for="email">Enter your email address:</label>
        <input type="email" id="email" name="email" required placeholder="Enter your registered email">
        <button type="submit">Submit</button>
        <a href="home.jsp">Home</a>
    </form>
</body>
</html>
