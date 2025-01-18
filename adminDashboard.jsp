<%@ page import="java.util.List" %> <!-- Import List -->
<%@ page import="pack.User" %> <!-- Import User class from the package -->

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h1>Welcome, Admin!</h1>
    <p>This is your dashboard.</p>

    <table>
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Date of Birth</th>
                <th>Pincode</th>
                <th>Address</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Retrieve the userList from the request
                List<User> userList = (List<User>) request.getAttribute("userList");

                if (userList != null && !userList.isEmpty()) {
                    for (User user : userList) {
            %>
            <tr>
                <td><%= user.getFirstName() %></td>
                <td><%= user.getLastName() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getPhone() %></td>
                <td><%= user.getDateOfBirth() %></td>
                <td><%= user.getPincode() %></td>
                <td><%= user.getAddress() %></td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr><td colspan="7">No users found.</td></tr>
            <% 
                }
            %>
        </tbody>
    </table>
    <a href="adminLogin.jsp">Logout</a>
</body>
</html>
