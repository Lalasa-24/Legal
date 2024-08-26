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

@WebServlet("/CommencementDateServlet")
public class CommencementDateServlet extends HttpServlet {

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

            // Fetch data for Commercial Contracts
            cstmt = conn.prepareCall("{call GetCommercialContractsCommencementData}");
            rs = cstmt.executeQuery();
            while (rs.next()) {
                String commencementType = rs.getString("commencementType");
                int agreementCount = rs.getInt("agreement_count");

                data.get("commercial").put(commencementType, agreementCount);
            }

            // Close resources for Commercial Contracts
            if (rs != null) rs.close();
            if (cstmt != null) cstmt.close();

            // Fetch data for Service Contracts
            cstmt = conn.prepareCall("{call GetServiceContractsCommencementData}");
            rs = cstmt.executeQuery();
            while (rs.next()) {
                String commencementType = rs.getString("commencementType");
                int agreementCount = rs.getInt("agreement_count");

                data.get("service").put(commencementType, agreementCount);
            }

        } finally {
            // Close all resources in finally block
            if (rs != null) rs.close();
            if (cstmt != null) cstmt.close();
            if (conn != null) conn.close();
        }

        return data;
    }
}
