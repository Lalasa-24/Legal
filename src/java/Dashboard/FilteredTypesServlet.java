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

@WebServlet("/FilteredTypesServlet")
public class FilteredTypesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String executionDate = request.getParameter("executionDate");
        String expiryDate = request.getParameter("expiryDate");
        String contractType = request.getParameter("contractType");

        // Data structure to hold the JSON response
        Map<String, Map<String, Integer>> responseData = new HashMap<>();
        Map<String, Integer> overallCounts = new HashMap<>();

        Connection conn = null;
        CallableStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(DBParameters.URL, DBParameters.USER, DBParameters.PASSWORD);

            // Call the stored procedure
            String sql = "{CALL GetFilteredAgreements(?, ?, ?)}";
            stmt = conn.prepareCall(sql);
            stmt.setDate(1, executionDate != null && !executionDate.isEmpty() ? Date.valueOf(executionDate) : null);
            stmt.setDate(2, expiryDate != null && !expiryDate.isEmpty() ? Date.valueOf(expiryDate) : null);
            stmt.setString(3, contractType != null && !contractType.isEmpty() ? contractType : null);

            rs = stmt.executeQuery();

            // Process result set
            while (rs.next()) {
                String department = rs.getString("department");
                String agreementType = rs.getString("agreementType");
                int count = rs.getInt("agreement_count");

                // Initialize department data if not already done
                responseData.putIfAbsent(department, new HashMap<>());
                
                // Add the count for the specific agreement type
                responseData.get(department).put(agreementType, count);

                // Accumulate the overall count for each agreement type
                overallCounts.put(agreementType, overallCounts.getOrDefault(agreementType, 0) + count);
            }

            // Add overall data to the response
            responseData.put("overall", overallCounts);

            // Convert the response data to JSON
            String json = new Gson().toJson(responseData);

            // Set the JSON data as a request attribute
            request.setAttribute("filteredData", json);

            // Forward the request to the JSP page
            request.getRequestDispatcher("FilteredTypes.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
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
