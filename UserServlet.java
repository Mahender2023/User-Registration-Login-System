import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    // JDBC URL, username, and password
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Projectno01";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "MAhi";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
		    // Register user
		    String firstName = request.getParameter("firstName");
		    String lastName = request.getParameter("lastName");
		    String email = request.getParameter("email");
		    String phone = request.getParameter("phone");
		    String password = request.getParameter("password");
		    String date = request.getParameter("dob");
		    String pincode = request.getParameter("pincode");
		    String address = request.getParameter("address");

		    // Establishing connection to the database
		    try (Connection con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD)) {
		        // Insert query
		        String query = "INSERT INTO userdata (firstName, lastName, email, phone, password, date, pincode, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		        // Prepare the statement
		        try (PreparedStatement stmt = con.prepareStatement(query)) {
		            stmt.setString(1, firstName);
		            stmt.setString(2, lastName);
		            stmt.setString(3, email);
		            stmt.setString(4, phone);
		            stmt.setString(5, password);
		            stmt.setString(6, date);
		            stmt.setString(7, pincode);
		            stmt.setString(8, address);

		            int rowsAffected = stmt.executeUpdate();

		            if (rowsAffected > 0) {
		                // Registration successful, show confirmation
		                response.getWriter().write("User registered successfully.");
		             // Registration successful, redirect to the login page
		                response.sendRedirect("userLogin.jsp");
		            } else {
		                // Registration failed, show error
		                response.getWriter().write("Registration failed. Please try again.");
		                
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace(); // Log the exception for debugging
		        response.getWriter().write("Database error during registration: " + e.getMessage()); // Send detailed error message
		    }

		} else if ("login".equals(action)) {
		    // Login user
		    String email = request.getParameter("Email");
		    String password = request.getParameter("Password");

		    // Establishing connection to the database
		    try (Connection con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD)) {
		        // Query to verify user credentials
		        String query = "SELECT * FROM userdata WHERE email = ? AND password = ?";

		        try (PreparedStatement stmt = con.prepareStatement(query)) {
		            stmt.setString(1, email);  // email
		            stmt.setString(2, password);   // password

		            try (ResultSet rs = stmt.executeQuery()) {
		                if (rs.next()) {
		                    // Valid login, set session attributes
		                    String firstName = rs.getString("firstName");
		                    String lastName = rs.getString("lastName");
		                    String phone = rs.getString("phone");
		                    String date = rs.getString("date");
		                    String pincode = rs.getString("pincode");
		                    String address = rs.getString("address");

		                    // Set session attributes
		                    HttpSession session = request.getSession();
		                    session.setAttribute("firstName", firstName);  // Correct attribute name
		                    session.setAttribute("lastName", lastName);    // Correct attribute name
		                    session.setAttribute("email", email);  
		                    session.setAttribute("phone", phone);  // Email is unique, so it's safe to set as a session attribute
		                    session.setAttribute("date", date);
		                    session.setAttribute("pincode", pincode);
		                    session.setAttribute("address", address);

		                    // Redirect to the user dashboard
		                    response.sendRedirect("userDashboard.jsp");

		                } else {
		                    // Invalid login, handle the error
		                    response.getWriter().write("Invalid email or password.");
		                }
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        response.getWriter().write("Database error: " + e.getMessage());
		    }

		} else if ("forgotPassword".equals(action)) {
		
		    String email = request.getParameter("email");
		    
		    response.getWriter().write("<h1>Password reset link sent to </h1> " + email);
		}
    }
}
