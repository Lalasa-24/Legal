


package SContract;

import CContract.CommercialCServlet;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/ServiceCServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ServiceCServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "D:/Internship/UploadFiles/uploads"; // Adjust this path

    public ServiceCServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the request is multipart
        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new ServletException("Content type is not multipart/form-data");
        }

        // Create the save directory if it does not exist
        File fileSaveDir = new File(UPLOAD_DIR);
        if (!fileSaveDir.exists()) {
            if (!fileSaveDir.mkdirs()) {
                throw new IOException("Failed to create directory: " + fileSaveDir.getAbsolutePath());
            }
        }

        // Store the filenames of the uploaded files
          // Store the filenames of the uploaded files
       String uploadFile1 = "";  
String uploadFile2 = "";  
String uploadFile3 = "";  
String uploadFile4 = "";  
String uploadFile5 = "";  

// Get all parts and process each file  
Collection<Part> parts = request.getParts();  
for (Part part : parts) {  
    // Check if the part is a file  
    if (part.getContentType() != null) {  
        String fileName = extractFileName(part);  
        if (fileName != null && !fileName.isEmpty()) {  
            String filePath = UPLOAD_DIR + File.separator + fileName;  
            try {  
                part.write(filePath);  

                // Save file paths  
                if (uploadFile1.isEmpty()) {  
                    uploadFile1 = fileName;  
                } else if (uploadFile2.isEmpty()) {  
                    uploadFile2 = fileName;  
                } else if (uploadFile3.isEmpty()) {  
                    uploadFile3 = fileName;  
                } else if (uploadFile4.isEmpty()) {  
                    uploadFile4 = fileName;  
                } else if (uploadFile5.isEmpty()) {  
                    uploadFile5 = fileName;  
                }  
            } catch (IOException e) {  
                Logger.getLogger(ServiceCServlet.class.getName()).log(Level.SEVERE, "Error writing file: " + fileName, e);  
                // Handle the error (log it, set error message, etc.)  
            }  
        }  
    }  
}  


        // Handle other form fields and database insertion
        String agreementNo = request.getParameter("agreementNo");
        String referenceId = request.getParameter("referenceId");
        String documentNature = request.getParameter("documentNature");
        String agreementType = request.getParameter("agreementType");
        String agreementScope = request.getParameter("agreementScope");
        String department = request.getParameter("department");
        String partyName = request.getParameter("partyName");
       // String executionDate = request.getParameter("executionDate");
       // String expiryDate = request.getParameter("expiryDate");
        String commencementType = request.getParameter("commencementType");
     //   String commencementDate = request.getParameter("commencementDate");
        String location = request.getParameter("location");
        String securityDeposits = request.getParameter("securityDeposits");
        String recipient1 = request.getParameter("recipient1");
        String recipient2 = request.getParameter("recipient2");
        String recipient3 = request.getParameter("recipient3");
        String recipient4 = request.getParameter("recipient4");
        String recipient5 = request.getParameter("recipient5");
        String recipient6 = request.getParameter("recipient6");
        String additionalList = request.getParameter("additionalList");
        String remarks = request.getParameter("remarks");
        String serviceCharges = request.getParameter("serviceCharges");
        String camChargesS = request.getParameter("camChargesS");
        String utilityChargesS = request.getParameter("utilityChargesS");
        String performanceBG = request.getParameter("performanceBG");
        String retentionBG = request.getParameter("retentionBG");
        String adavnceBG = request.getParameter("adavnceBG");
        String defectLiability = request.getParameter("defectLiability");
        String latentDefectL = request.getParameter("latentDefectL");
        String liquidatedDamages = request.getParameter("liquidatedDamages");
        String dataEnteredBy = (String) request.getSession().getAttribute("username");
         String executionDate = formatDate(request.getParameter("executionDate"));  
     System.out.println("exec:"+executionDate);
    String expiryDate = formatDate(request.getParameter("expiryDate"));  
    String commencementDate = formatDate(request.getParameter("commencementDate"));  

        // Create CommercialC object with all form fields and uploaded files
//        ServiceC servicec = new ServiceC(agreementNo, referenceId, documentNature, agreementType, agreementScope, department, partyName,
//                executionDate, expiryDate,commencementType, commencementDate, location, securityDeposits, recipient1, recipient2, recipient3, recipient4, recipient5, recipient6,
//                 uploadFile1, uploadFile2, uploadFile3, uploadFile4, uploadFile5, remarks,serviceCharges,camChargesS,utilityChargesS,performanceBG,retentionBG,adavnceBG,
//        defectLiability,latentDefectL,liquidatedDamages);
              ServiceC servicec = new ServiceC(agreementNo, referenceId, documentNature, agreementType, agreementScope, department, partyName,
                executionDate, expiryDate,commencementType, commencementDate, location, securityDeposits, recipient1, recipient2, recipient3, recipient4, recipient5, recipient6,
                additionalList, uploadFile1, uploadFile2, uploadFile3, uploadFile4, uploadFile5, remarks, serviceCharges, camChargesS, utilityChargesS, performanceBG, retentionBG, 
                 adavnceBG, defectLiability, latentDefectL, liquidatedDamages,dataEnteredBy);

        // Insert into database
        ServiceCDB cdao = new ServiceCDB();
        String result = null;
        try {
            result = cdao.insert(servicec);
            // Check if insertion was successful
            if ("Data Entered Successfully".equals(result)) {
                // Redirect to CommercialContract.jsp after successful insertion
                response.sendRedirect("ServiceContract.jsp");
                return; // Stop further execution
            } else {
                // Handle insertion failure
                throw new SQLException("Failed to insert data into database");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCServlet.class.getName()).log(Level.SEVERE, "Error inserting data into database", ex);
            result = "Error inserting data: " + ex.getMessage(); // Provide feedback for insertion failure
        }

        // Set the result attribute for the JSP (if needed for error handling)
        request.setAttribute("insertionResult", result);
        
        // Forward the request to an error page or display an error message
        request.getRequestDispatcher("ServiceContract.jsp").forward(request, response);
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1).replace("\\", "/").replace("\"", "");
            }
        }
        return null;
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