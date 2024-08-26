package Dashboard;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.DBParameters;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Add CORS headers
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET");

        Map<String, Map<String, Integer>> data = new HashMap<>();
        try {
            data = fetchDataFromDatabase();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DashboardServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        Gson gson = new Gson();
        String json = gson.toJson(data);

        try (PrintWriter out = response.getWriter()) {
            out.print(json);
            out.flush();
        }
    }

    private Map<String, Map<String, Integer>> fetchDataFromDatabase() throws ClassNotFoundException, SQLException {
        Map<String, Map<String, Integer>> data = new HashMap<>();
        data.put("commercial", new HashMap<>());
        data.put("service", new HashMap<>());

        Connection conn = null;
        CallableStatement cstmt = null;
        ResultSet rs = null;

        try {
            // Connect to the database
            Class.forName(DBParameters.JDBC_DRIVER);
            conn = DriverManager.getConnection(DBParameters.URL, DBParameters.USER, DBParameters.PASSWORD);

            // Call stored procedure for Commercial Contract counts
            cstmt = conn.prepareCall("{call GetCommercialContractCounts}");
            rs = cstmt.executeQuery();

            // Retrieve and store data in map
            while (rs.next()) {
                String department = rs.getString("department");
                int agreement_count = rs.getInt("agreement_count");
                data.get("commercial").put(department, agreement_count);
            }

            // Close resources
            rs.close();
            cstmt.close();

            // Call stored procedure for Service Contract counts
            cstmt = conn.prepareCall("{call GetServiceContractCounts}");
            rs = cstmt.executeQuery();

            // Retrieve and store data in map
            while (rs.next()) {
                String department = rs.getString("department");
                int agreement_count = rs.getInt("agreement_count");
                data.get("service").put(department, agreement_count);
            }
        } finally {
            // Close resources in finally block
            if (rs != null) rs.close();
            if (cstmt != null) cstmt.close();
            if (conn != null) conn.close();
        }

        return data;
    }
}
