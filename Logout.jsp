<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Logout</title>
</head>
<body>
    <%
        // Invalidate the current session to log out the user
        session.invalidate();
    %>
    <h2>You have been successfully logged out!</h2>
    <p>Redirecting you to the login page...</p>

    <script type="text/javascript">
        // Redirect to the login page after a short delay
        setTimeout(function() {
            window.location.href = "userLogin.jsp"; // Replace with your login page URL
        }, 2000); // 2 seconds delay
    </script>
</body>
</html>