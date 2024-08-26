package CAgreement;  

import CContract.CommercialCServlet;
import java.io.IOException;  
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.CallableStatement;  
import java.sql.SQLException;  
import java.text.ParseException;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
import db.DBParameters;  
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/UpdateAgreementServlet")  
public class UpdateAgreementServlet extends HttpServlet {  
    private static final long serialVersionUID = 1L;  

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        String agreementNo = request.getParameter("agreementNo");  
        String partyName = request.getParameter("partyName");  
        String commencementType = request.getParameter("commencementType");  
          String commencementDate = formatDate(request.getParameter("commencementDate"));    
        String recipient1 = request.getParameter("recipient1");  
        String recipient2 = request.getParameter("recipient2");  
        String recipient3 = request.getParameter("recipient3");  
        String recipient4 = request.getParameter("recipient4");  
        String recipient5 = request.getParameter("recipient5");  
        String recipient6 = request.getParameter("recipient6");  
//        String remarks = request.getParameter("remarks");  
        String agreementStatus = request.getParameter("agreementStatus");  

        // Fetch the username from the session  
        HttpSession session = request.getSession();  
        String username = (String) session.getAttribute("username");  

        // Debug: Print the session username  
        System.out.println("Session username: " + username);  

        // Get the modifiedBy parameter, falling back to the session username if necessary  
        String modifiedBy = request.getParameter("modifiedBy");  
        if (modifiedBy == null || modifiedBy.trim().isEmpty()) {  
            modifiedBy = username;  
        }  

        // Debug: Print the modifiedBy value before updating  
        System.out.println("Modified by: " + modifiedBy);  

        // New variable to hold the modified date  
        String modifiedDate = new SimpleDateFormat("dd-MM-yyyy").format(new Date());  

        Connection conn = null;  
        CallableStatement cstmt = null;  
        try {  
            Class.forName(DBParameters.JDBC_DRIVER);  
            conn = DriverManager.getConnection(DBParameters.URL, DBParameters.USER, DBParameters.PASSWORD);  

            // Prepare the stored procedure call  
            String storedProc = "{call UpdateCommercialContract(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";  
            cstmt = conn.prepareCall(storedProc);  

            // Set parameters for the stored procedure  
            cstmt.setString(1, agreementNo);  
            cstmt.setString(2, partyName);  
            cstmt.setString(3, commencementType);  
            cstmt.setString(4, commencementDate);  
            cstmt.setString(5, recipient1);  
            cstmt.setString(6, recipient2);  
            cstmt.setString(7, recipient3);  
            cstmt.setString(8, recipient4);  
            cstmt.setString(9, recipient5);  
            cstmt.setString(10, recipient6);  
            cstmt.setString(11, modifiedBy); // Use the modifiedBy with default if needed  
//            cstmt.setString(12, remarks);  
            cstmt.setString(12, agreementStatus);  
            cstmt.setString(13, modifiedDate); // Add modifiedDate parameter  

            // Execute the stored procedure  
            int rowsUpdated = cstmt.executeUpdate();  
            if (rowsUpdated > 0) {  
                // Logging the successful update  
                System.out.println("Agreement updated successfully!");  
                // Redirect to CommercialAgreements.jsp after successful update  
                response.getWriter().println("<script type='text/javascript'>");  
                response.getWriter().println("alert('Agreement updated successfully!');");  
                response.getWriter().println("window.location.href = 'CommercialAgreements.jsp';");  
                response.getWriter().println("</script>");  
            } else {  
                // Logging the error  
                System.out.println("Error: No rows updated. Check agreementNo: " + agreementNo);  
                response.getWriter().println("<script type='text/javascript'>");  
                response.getWriter().println("alert('Error updating agreement!');");  
                response.getWriter().println("window.location.href = 'EditPage.jsp';");  
                response.getWriter().println("</script>");  
            } 
            
        } catch (SQLException | ClassNotFoundException e) {  
            e.printStackTrace();  
            response.getWriter().println("<script type='text/javascript'>");  
            response.getWriter().println("alert('Error: " + e.getMessage() + "');");  
            response.getWriter().println("window.location.href = 'EditPage.jsp';");  
            response.getWriter().println("</script>");  
        }
         finally {  
            try {  
                if (cstmt != null) cstmt.close();  
                if (conn != null) conn.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }
    }
      private String formatDate(String dateStr) {  
        if (dateStr == null || dateStr.isEmpty()) {  
            return dateStr; // Return null or empty string if date is null  
        }  

        try {  
            // Original date format  
            SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd");  
            // Desired date format  
            SimpleDateFormat targetFormat = new SimpleDateFormat("dd-MM-yyyy");  
            
            // Parse the date and format it to the desired format  
            Date date = originalFormat.parse(dateStr);  
            return targetFormat.format(date);  
        } catch (ParseException e) {  
            Logger.getLogger(CommercialCServlet.class.getName()).log(Level.SEVERE, "Error parsing date: " + dateStr, e);  
            return dateStr; // Return original string if parsing fails  
        }  
    }  
}
