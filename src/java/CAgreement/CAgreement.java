package CAgreement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.DBParameters;
import java.sql.CallableStatement;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CAgreement")
public class CAgreement extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    Connection conn = null;

    public void init() throws ServletException {
        try {
            Class.forName(DBParameters.JDBC_DRIVER);
            conn = DriverManager.getConnection(DBParameters.URL, DBParameters.USER, DBParameters.PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // Modify the doGet method in your servlet
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><style>" +
                    "body { padding-top: 0px; }" +
                    "table { border-collapse: collapse; width:100%;}" +
                    "th, td { text-align: center; }" +
                    "tr:nth-child(even) {background-color: #f2f2f2;}" +
                    "</style></head><body>");
         out.println("<div style='text-align: right; padding-right: 6.8%;'>");  
out.println("<button class='toggleparts' style='position:fixed; height: auto;width:auto;' onclick='toggleParts()'>Other Fields</button>");  
out.println("</div>"); 

out.println("<br>"); 
//out.println("<br>"); 

//        out.println("<button class='toggleparts' onclick='toggleParts()'>Other Fields</button>");//style='position:fixed;margin-top:-30px;
//        out.println("<div style='text-align: right; padding: 10%;'>");  
//      out.println("<div style='text-align: right; padding: 10%;'>");  
//out.println("<button class='toggleparts' style='position:fixed; height: 5%;' onclick='toggleParts()'>Other Fields</button>");  
//out.println("</div>"); 
//        out.println("</div>");  
        out.println("<div id='part1'>");
      out.println("<table class='table1'><tr><th>AGREEMENT ID</th>"  
                + "<th>AGREEMENT NO</th>"  
                + "<th>REFERENCE ID</th>"  
                + "<th>NATURE OF AGREEMENT</th>"  
                + "<th>AGREEMENT TYPE</th>"  
                + "<th>AGREEMENT SCOPE</th>"  
                + "<th>NAME OF THE PARTY</th>"  
                + "<th>DATE OF EXECUTION</th></tr>");
        // Call the stored procedure to retrieve part 1 data
        CallableStatement stmt1 = conn.prepareCall("{call GetCommercialContracts}");
        boolean hasResults = stmt1.execute();

        if (hasResults) {
            ResultSet rs1 = stmt1.getResultSet();
            int serialNumber = 1;
            while (rs1.next()) {
                String agreementNo = rs1.getString("agreementNo");
                String referenceId = rs1.getString("referenceId");
                String documentNature = rs1.getString("documentNature");
                String agreementType = rs1.getString("agreementType");
                String agreementScope = rs1.getString("agreementScope");
                String partyName = rs1.getString("partyName");
                String executionDate = rs1.getString("executionDate");
//                String expiryDate = rs1.getString("expiryDate");
//                String commencementDate = rs1.getString("commencementDate");

                out.println("<tr>" + 
                            "<td><a href=\"EditPage.jsp?agreementNo=" + agreementNo + "\">ID" + serialNumber++ + "</a></td>" + 
                            "<td>" + agreementNo + "</td>" + 
                            "<td>" + referenceId + "</td>" + 
                            "<td>" + documentNature + "</td>" +
                            "<td>" + agreementType + "</td>" +
                            "<td>" + agreementScope + "</td>" +
                            "<td>" + partyName + "</td>" +
                            "<td>" + executionDate + "</td>" +
//                            "<td>" + expiryDate + "</td>" +
//                            "<td>" + commencementDate + "</td>" +
                            "</tr>");
            }
            rs1.close();
        }

        out.println("</table>");
        out.println("</div>");

        // Part 2: Display additional fields
        out.println("<div id='part2' style='display: none;'>");
        out.println("<table border='1'>" +
                    "<tr>" +
                    "<th>AGREEMENT NO</th>" +
                    "<th>DEPARTMENT</th>" +
                    "<th>EXPIRY DATE</th>" +
                    "<th>COMMENCEMENT DATE</th>" +
                    "<th>COMMENCEMENT TYPE</th>" +
                    "<th>RECIPIENT1</th>" +
                    "<th>RECIPIENT2</th>" +
                    "<th>RECIPIENT3</th>" +
                    "<th>RECIPIENT4</th>" +
                    "<th>RECIPIENT5</th>" +
                    "<th>RECIPIENT6</th>" +
                    "<th>UPLOAD FILE1</th>" +
                    "<th>UPLOAD FILE2</th>" +
                    "<th>UPLOAD FILE3</th>" +
                    "<th>UPLOAD FILE4</th>" +
                    "<th>UPLOAD FILE5</th>" +
                    "<th>LOCATION</th>" +
                    "<th>SECURITY DEPOSITS</th>" +
                    "<th>ADDITIONAL LIST</th>" +
                    "<th>MODIFIED BY</th>" +
                    "<th>ENTRY DATE</th>" +
                    "<th>MODIFIED DATE</th>" +
                    "<th>LICENSE FEES/ CONCESSION FEE</th>" +
                    "<th>CAM CHARGES</th>" +
                    "<th>UTILITY</th>" +
                    "<th>REVENUE SHARE</th>" +
                    "<th>MMG</th>" +
                    "<th>PROMOTIONAL & ADVERTISEMENT CHARGES</th>" +
                    "<th>LOADING AND UNLOADING CHARGES</th>" +
                    "<th>BACK OF HOUSE CHARGES/ STORAGE CHARGES</th>" +
                    "<th>DEVIATION</th>" +
                    "<th>REMARKS</th>" +
                    "<th>AGREEMENT STATUS</th>" +
                    "</tr>");

        // Call the stored procedure to retrieve part 2 data
        boolean moreResults = stmt1.getMoreResults();
        if (moreResults) {
            ResultSet rs2 = stmt1.getResultSet();
            while (rs2.next()) {
                String agreementNo = rs2.getString("agreementNo");
                String department = rs2.getString("department");
                String expiryDate = rs2.getString("expiryDate");
                String commencementDate = rs2.getString("commencementDate");
                String commencementType = rs2.getString("commencementType");
                String recipient1 = rs2.getString("recipient1");
                String recipient2 = rs2.getString("recipient2");
                String recipient3 = rs2.getString("recipient3");
                String recipient4 = rs2.getString("recipient4");
                String recipient5 = rs2.getString("recipient5");
                String recipient6 = rs2.getString("recipient6");
                String uploadFile1 = rs2.getString("uploadFile1");
                String uploadFile2 = rs2.getString("uploadFile2");
                String uploadFile3 = rs2.getString("uploadFile3");
                String uploadFile4 = rs2.getString("uploadFile4");
                String uploadFile5 = rs2.getString("uploadFile5");
                String location = rs2.getString("location");
                String securityDeposits = rs2.getString("securityDeposits");
                String additionalList = rs2.getString("additionalList");
                String modifiedBy = rs2.getString("modifiedBy");
                String EntryDate = rs2.getString("EntryDate");
                String modifiedDate = rs2.getString("modifiedDate");
                String licenseFees = rs2.getString("licenseFees");
                String camChargesC = rs2.getString("camChargesC");
                String utility = rs2.getString("utility");
                String revenueShare = rs2.getString("revenueShare");
                String mmg = rs2.getString("mmg");
                String promotionalCharges = rs2.getString("promotionalCharges");
                String loading = rs2.getString("loading");
                String backOf = rs2.getString("backOf");
                String deviation = rs2.getString("deviation");
                String remarks = rs2.getString("remarks");
                String agreementStatus = rs2.getString("agreementStatus");

                out.println("<tr>" +
                            "<td>" + agreementNo + "</td>" +
                            "<td>" + department + "</td>" +        
                            "<td>" + expiryDate + "</td>" +
                            "<td>" + commencementDate + "</td>" +
                            "<td>" + commencementType + "</td>" +
                            "<td>" + recipient1 + "</td>" +
                            "<td>" + recipient2 + "</td>" +
                            "<td>" + recipient3 + "</td>" +
                            "<td>" + recipient4 + "</td>" +
                            "<td>" + recipient5 + "</td>" +
                            "<td>" + recipient6 + "</td>" +
                            "<td><a href='DownloadFile?fileName=" + uploadFile1 + "'>" + uploadFile1 + "</a></td>" +
                            "<td><a href='DownloadFile?fileName=" + uploadFile2 + "'>"+ uploadFile2 +"</a></td>" +
                            "<td><a href='DownloadFile?fileName=" + uploadFile3 + "'>"+ uploadFile3 +"</a></td>" +
                            "<td><a href='DownloadFile?fileName=" + uploadFile4 + "'>"+ uploadFile4 +"</a></td>" +
                            "<td><a href='DownloadFile?fileName=" + uploadFile5 + "'>"+ uploadFile5 +"</a></td>" +        
                            "<td>" + location + "</td>" + 
                            "<td>" + securityDeposits + "</td>" +
                            "<td>" + additionalList + "</td>" +
                            "<td>" + modifiedBy + "</td>" +
                            "<td>" + EntryDate + "</td>" +
                            "<td>" + modifiedDate + "</td>" +
                            "<td>" + licenseFees + "</td>" + 
                            "<td>" + camChargesC + "</td>" +            
                            "<td>" + utility + "</td>" +
                            "<td>" + revenueShare + "</td>" +            
                            "<td>" + mmg + "</td>" +            
                            "<td>" + promotionalCharges + "</td>" +
                            "<td>" + loading + "</td>" +            
                            "<td>" + backOf + "</td>" +            
                            "<td>" + deviation + "</td>" +           
                            "<td>" + remarks + "</td>" +
                            "<td>" + agreementStatus + "</td>" +
                            "</tr>");
            }
            rs2.close();
        }

        out.println("</table>");
        out.println("</div>");

        stmt1.close();
        out.println("<script>" +
                    "function toggleParts() {" +
                    "  var part1 = document.getElementById('part1');" +
                    "  var part2 = document.getElementById('part2');" +
                    "  if (part1.style.display === 'none') {" +
                    "    part1.style.display = 'block';" +
                    "    part2.style.display = 'none';" +
                    "  } else {" +
                    "    part1.style.display = 'none';" +
                    "    part2.style.display = 'block';" +
                    "  }" +
                    "}" +
                    "</script>");

        out.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
}