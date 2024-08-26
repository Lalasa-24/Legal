package Report;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.DBParameters;

@WebServlet("/ReportsServlet")
public class ReportsServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String executionDate = request.getParameter("executionDate");
        String expiryDate = request.getParameter("expiryDate");
        String contractType = request.getParameter("contractType");
        
        System.out.println("executionDate: " + executionDate);
        System.out.println("expiryDate: " + expiryDate);
        System.out.println("contractType: " + contractType);
        
        Connection conn = null;
        CallableStatement cstmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName(DBParameters.JDBC_DRIVER);
            conn = DriverManager.getConnection(DBParameters.URL, DBParameters.USER, DBParameters.PASSWORD);
            String sql = "{call GetReportAgreementsByDates(?, ?, ?)}";
            
            cstmt = conn.prepareCall(sql);
            cstmt.setString(1, executionDate);
            cstmt.setString(2, expiryDate);
            cstmt.setString(3, contractType); // Pass the contractType parameter
            
            rs = cstmt.executeQuery();
            
            List<Map<String, String>> agreements = new ArrayList<>();
            
            while (rs.next()) {
                Map<String, String> agreement = new HashMap<>();
                agreement.put("agreementNo", rs.getString("agreementNo"));
                agreement.put("referenceId", rs.getString("referenceId"));
                agreement.put("documentNature", rs.getString("documentNature"));
                agreement.put("agreementType", rs.getString("agreementType"));
                agreement.put("agreementScope", rs.getString("agreementScope"));
                agreement.put("partyName", rs.getString("partyName"));
                agreement.put("executionDate", rs.getString("executionDate"));
                agreement.put("expiryDate", rs.getString("expiryDate"));
                agreement.put("commencementDate", rs.getString("commencementDate"));
                agreement.put("commencementType", rs.getString("commencementType"));
                agreement.put("department", rs.getString("department"));
                // Part 2 fields (adjust as per your database structure)
                agreement.put("location", rs.getString("location"));
                agreement.put("additionalList", rs.getString("additionalList"));
                agreement.put("recipient1", rs.getString("recipient1"));
                agreement.put("recipient2", rs.getString("recipient2"));
                agreement.put("recipient3", rs.getString("recipient3"));
                agreement.put("recipient4", rs.getString("recipient4"));
                agreement.put("recipient5", rs.getString("recipient5"));
                agreement.put("recipient6", rs.getString("recipient6"));
                agreement.put("uploadFile1", rs.getString("uploadFile1"));
                agreement.put("uploadFile2", rs.getString("uploadFile2"));
                agreement.put("uploadFile3", rs.getString("uploadFile3"));
                agreement.put("uploadFile4", rs.getString("uploadFile4"));
                agreement.put("uploadFile5", rs.getString("uploadFile5"));
                agreement.put("modifiedBy", rs.getString("modifiedBy"));
                agreement.put("EntryDate", rs.getString("EntryDate"));
                agreement.put("modifiedDate", rs.getString("modifiedDate"));
                agreement.put("remarks", rs.getString("remarks"));
                agreement.put("agreementStatus", rs.getString("agreementStatus"));
             
                if ("commercial".equalsIgnoreCase(contractType)) {
                    agreement.put("securityDeposits", rs.getString("securityDeposits"));
                    agreement.put("licenseFees", rs.getString("licenseFees"));
                    agreement.put("camChargesC", rs.getString("camChargesC"));
                    agreement.put("utility", rs.getString("utility"));
                    agreement.put("revenueShare", rs.getString("revenueShare"));
                    agreement.put("mmg", rs.getString("mmg"));
                    agreement.put("promotionalCharges", rs.getString("promotionalCharges"));
                    agreement.put("loading", rs.getString("loading"));
                    agreement.put("backOf", rs.getString("backOf"));
                    agreement.put("deviation", rs.getString("deviation"));
                } else if ("service".equalsIgnoreCase(contractType)) {
                    agreement.put("serviceCharges", rs.getString("serviceCharges"));
                    agreement.put("camChargesS", rs.getString("camChargesS"));
                    agreement.put("utilityChargesS", rs.getString("utilityChargesS"));
                    agreement.put("performanceBG", rs.getString("performanceBG"));
                    agreement.put("retentionBG", rs.getString("retentionBG"));
                    agreement.put("advanceBG", rs.getString("advanceBG"));
                    agreement.put("defectLiability", rs.getString("defectLiability"));
                    agreement.put("latentDefectL", rs.getString("latentDefectL"));
                    agreement.put("liquidatedDamages", rs.getString("liquidatedDamages"));
                }

                agreements.add(agreement);
            }
            
            if (agreements.isEmpty()) {
                request.setAttribute("errorMessage", "Data Not Found");
                System.out.println("Data Not Found: " + executionDate + " " + expiryDate);
                request.getRequestDispatcher("NoDataFound.jsp").forward(request, response);
            } else {
                request.setAttribute("agreements", agreements);
                request.getRequestDispatcher("AgreementsReport.jsp").forward(request, response);
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (cstmt != null) cstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
