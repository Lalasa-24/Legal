package Dashboard;

import com.google.gson.Gson;
import db.DBParameters;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/FilteredDashboardServlet")
public class FilteredDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String executionDate = request.getParameter("executionDate");
        System.out.println("exec:"+executionDate);
        String expiryDate = request.getParameter("expiryDate");
        String contractType = request.getParameter("contractType");

        Map<String, Integer> responseData = new HashMap<>();

        if (executionDate != null && !executionDate.isEmpty() && 
            expiryDate != null && !expiryDate.isEmpty() && 
            contractType != null && !contractType.isEmpty()) {
            
            try (Connection conn = DriverManager.getConnection(DBParameters.URL, DBParameters.USER, DBParameters.PASSWORD);
                 CallableStatement stmt = conn.prepareCall("{CALL GetDashboardFilteredAgreements(?, ?, ?)}")) {

                stmt.setDate(1, Date.valueOf(executionDate));
                stmt.setDate(2, Date.valueOf(expiryDate));
                stmt.setString(3, contractType);

                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        String department = rs.getString("department");
                        int count = rs.getInt("agreement_count");
                        responseData.put(department, count);
                    }
                }

                String json = new Gson().toJson(responseData);
                System.out.println("JSON Data: " + json);

                // Determine if the request is for JSON data (e.g., AJAX call)
                if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                } else {
                    // Otherwise, forward the data to the JSP page
                    request.setAttribute("filteredData", json);
                    request.getRequestDispatcher("FilteredDashboard.jsp").forward(request, response);
                }

            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters");
        }
    }
}
