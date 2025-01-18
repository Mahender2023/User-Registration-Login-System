import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import pack.User;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Projectno01";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "MAhi";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            String userName = request.getParameter("userName");
            String password = request.getParameter("Password");

            try (Connection con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD)) {
                String query = "SELECT * FROM admindata WHERE userName = ? AND password = ?";
                try (PreparedStatement stmt = con.prepareStatement(query)) {
                    stmt.setString(1, userName);
                    stmt.setString(2, password);

                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            String username = rs.getString("userName");

                            HttpSession session = request.getSession();
                            session.setAttribute("userName", username);

                            // Query to get all users
                            String userQuery = "SELECT * FROM userdata";
                            try (PreparedStatement userStmt = con.prepareStatement(userQuery);
                                 ResultSet userRs = userStmt.executeQuery()) {

                                List<User> userList = new ArrayList<>();
                                while (userRs.next()) {
                                    User user = new User(
                                        userRs.getString("firstName"),
                                        userRs.getString("lastName"),
                                        userRs.getString("email"),
                                        userRs.getString("phone"),
                                        userRs.getString("date"),
                                        userRs.getString("pincode"),
                                        userRs.getString("address")
                                    );
                                    userList.add(user);
                                }

                                // Set user list in the request
                                request.setAttribute("userList", userList);
                            }

                            // Forward to adminDashboard.jsp
                            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
                        } else {
                            response.getWriter().write("Invalid username or password.");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("Error: " + e.getMessage());
            }
        }
    }
}