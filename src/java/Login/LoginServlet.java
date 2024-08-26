package Login;
import db.DBParameters;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginServlet")  
public class LoginServlet extends HttpServlet {  

    protected void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  

        String username = request.getParameter("username");  
        String password = request.getParameter("password");  

        Connection conn = null;  
        PreparedStatement stmt = null;  
        ResultSet rs = null;  

        try {  
            Class.forName(DBParameters.JDBC_DRIVER);  
            conn = DriverManager.getConnection(DBParameters.URL, DBParameters.USER, DBParameters.PASSWORD);  

            // Call the stored procedure  
            String sql = "{CALL userAppl(?, ?)}";  
            stmt = conn.prepareCall(sql);  
            stmt.setString(1, username);  
            System.out.println("Username:" + username);  
            stmt.setString(2, password);  
            System.out.println("Password:" + password);  
            rs = stmt.executeQuery();  

            if (rs.next()) {  
                // Login successful  
                // Create a session and store the username  
                HttpSession session = request.getSession();  
                session.setAttribute("username", username); // Store username in session  

                response.sendRedirect("CommercialAgreements.jsp");  
            } else {  
                // Check if the user exists but is inactive  
                sql = "SELECT * FROM Appl_Users WHERE Login_Users = ? AND Login_Password = ?";  
                stmt = conn.prepareStatement(sql);  
                stmt.setString(1, username);  
                stmt.setString(2, password);  
                rs = stmt.executeQuery();  

                if (rs.next()) {  
                    // User is inactive  
                    request.setAttribute("errorMessage", "User is inactive");  
                    System.out.println("Username is inactive:" + username);  
                } else {  
                    // Invalid credentials  
                    request.setAttribute("errorMessage", "Invalid username or password");  
                    System.out.println("Invalid Username or password:" + username);  
                }  
                // Forward the request back to the login page  
                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);  
            }  

        } catch (ClassNotFoundException | SQLException e) {  
            e.printStackTrace();  
            response.getWriter().println("Error: " + e.getMessage());  
        } finally {  
            try {  
                if (rs != null) rs.close();  
                if (stmt != null) stmt.close();  
                if (conn != null) conn.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
    }  
}