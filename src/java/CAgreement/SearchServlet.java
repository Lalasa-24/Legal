package CAgreement;

import db.DBParameters;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection conn = null;

    public void init() throws ServletException {
        try {
            Class.forName(DBParameters.JDBC_DRIVER);
            conn = DriverManager.getConnection(DBParameters.URL, DBParameters.USER, DBParameters.PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database connection failed", e);
        }
    }

    public void destroy() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String searchInput = request.getParameter("searchInput");

        try {
            // Call the stored procedure
            CallableStatement stmt = conn.prepareCall("{call SearchCommercialContracts(?)}");
            stmt.setString(1, searchInput);

            ResultSet rs = stmt.executeQuery();

            List<Map<String, String>> part1Results = new ArrayList<>();
            List<Map<String, String>> part2Results = new ArrayList<>();

            while (rs.next()) {
                Map<String, String> row = new LinkedHashMap<>();
                row.put("agreementNo", rs.getString("agreementNo"));
                row.put("referenceId", rs.getString("referenceId"));
                row.put("documentNature", rs.getString("documentNature"));
                row.put("agreementType", rs.getString("agreementType"));
                row.put("agreementScope", rs.getString("agreementScope"));
                row.put("partyName", rs.getString("partyName"));
                row.put("executionDate", rs.getString("executionDate"));
               
                part1Results.add(row);

                Map<String, String> row2 = new LinkedHashMap<>();
                row2.put("agreementNo", rs.getString("agreementNo"));
                row2.put("department", rs.getString("department"));
                row2.put("expiryDate", rs.getString("expiryDate"));
                row2.put("commencementDate", rs.getString("commencementDate"));
                row2.put("commencementType", rs.getString("commencementType"));
                row2.put("recipient1", rs.getString("recipient1"));
                row2.put("recipient2", rs.getString("recipient2"));
                row2.put("recipient3", rs.getString("recipient3"));
                row2.put("recipient4", rs.getString("recipient4"));
                row2.put("recipient5", rs.getString("recipient5"));
                row2.put("recipient6", rs.getString("recipient6"));
                row2.put("uploadFile1", rs.getString("uploadFile1"));
                row2.put("uploadFile2", rs.getString("uploadFile2"));
                row2.put("uploadFile3", rs.getString("uploadFile3"));
                row2.put("uploadFile4", rs.getString("uploadFile4"));
                row2.put("uploadFile5", rs.getString("uploadFile5"));
                row2.put("location", rs.getString("location"));
                row2.put("securityDeposits", rs.getString("securityDeposits"));
                row2.put("additionalList", rs.getString("additionalList"));
                row2.put("modifiedBy", rs.getString("modifiedBy"));
                row2.put("EntryDate", rs.getString("EntryDate"));
                row2.put("modifiedDate", rs.getString("modifiedDate"));
                row2.put("licenseFees", rs.getString("licenseFees"));
                row2.put("camChargesC", rs.getString("camChargesC"));
                row2.put("utility", rs.getString("utility"));
                row2.put("revenueShare", rs.getString("revenueShare"));
                row2.put("mmg", rs.getString("mmg"));
                row2.put("promotionalCharges", rs.getString("promotionalCharges"));
                row2.put("loading", rs.getString("loading"));
                row2.put("backOf", rs.getString("backOf"));
                row2.put("deviation", rs.getString("deviation"));
//                row2.put("adavnceBG", rs.getString("adavnceBG"));
                row2.put("remarks", rs.getString("remarks"));
                row2.put("agreementStatus", rs.getString("agreementStatus"));
                part2Results.add(row2);
            }

            if (part1Results.isEmpty()) {
                request.setAttribute("noResults", true);
            } else {
                request.setAttribute("part1Results", part1Results);
                request.setAttribute("part2Results", part2Results);
            }

            request.getRequestDispatcher("SearchResults.jsp").forward(request, response);

            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Failed to execute SQL query", e);
        }
    }
}
