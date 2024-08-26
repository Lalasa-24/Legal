//package Dashboard;
//
//import java.sql.*;
//import java.util.*;
//import javax.mail.*;
//import javax.mail.internet.*;
//import javax.activation.*;
//import javax.mail.Session;
//import javax.mail.Transport;
//
//public class EmailNotificationServlet {
//
//    public static void main(String[] args) {
//        String dbUrl = "jdbc:sqlserver://localhost:1433;databaseName=Legal";
//        String dbUser = "sa";
//        String dbPassword = "Lalasa@lalu24";
//        
//        
//        Connection conn = null;
//        CallableStatement stmt = null;
//
//        try {
//            // Connect to the database
//            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
//
//            // Execute stored procedure
//            stmt = conn.prepareCall("{call GetCommercialContractsForEmailNotification}");
//            ResultSet rs = stmt.executeQuery();
//
//            // Convert ResultSet to List of Maps
//            List<Map<String, Object>> data = resultSetToList(rs);
//
//            // If data exists, send an alert email
//            if (!data.isEmpty()) {
//                sendEmail(data);
//            } else {
//                System.out.println("No alerts to send.");
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (stmt != null) stmt.close();
//                if (conn != null) conn.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
//
//    private static List<Map<String, Object>> resultSetToList(ResultSet rs) throws SQLException {
//        List<Map<String, Object>> list = new ArrayList<>();
//        ResultSetMetaData md = rs.getMetaData();
//        int columns = md.getColumnCount();
//
//        while (rs.next()) {
//            Map<String, Object> row = new HashMap<>(columns);
//            for (int i = 1; i <= columns; ++i) {
//                row.put(md.getColumnName(i), rs.getObject(i));
//            }
//            list.add(row);
//        }
//        return list;
//    }
//
//    private static void sendEmail(List<Map<String, Object>> data) {
//        String from = "senderexample02@gmail.com";
//        String to = "lalasanavya09@gmail.com";
//        String host = "smtp.gmail.com";
//        final String username = "senderexample02@gmail.com";
//        final String password = "gmjh pmtx qdnu skej";
//
////        Properties properties = System.getProperties();
////        properties.setProperty("mail.smtp.host", host);
////        properties.setProperty("mail.smtp.port", "587");
////        properties.setProperty("mail.smtp.auth", "true");
////        properties.setProperty("mail.smtp.starttls.enable", "true");
//
//     Properties properties = new Properties();
//        properties.put("mail.smtp.host", host);
//        properties.put("mail.smtp.port", "465"); // or 587 for TLS
//        properties.put("mail.smtp.auth", "true");
//        properties.put("mail.smtp.ssl.enable", "true"); // for SSL
//
//
//
//        Session session = Session.getDefaultInstance(properties, new Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(username, password);
//            }
//        });
//
//        try {
//            MimeMessage message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(from));
//            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
//            message.setSubject("Alert");
//
//            StringBuilder emailContent = new StringBuilder("<html><body>");
//            emailContent.append("<p>Dear Sir/Madam,</p>");
//            emailContent.append("<p>This is to bring to your kind notice that we have yet to receive the commencement date for the below mentioned agreement.</p>");
//            emailContent.append("<table border='1'>");
//
//                       // Define the display headings and their corresponding database column names
//            LinkedHashMap<String, String> headingMap = new LinkedHashMap<>();
//            headingMap.put("Agreement No", "agreementNo");
//            headingMap.put("Nature of Document", "documentNature");
//            headingMap.put("Type of Agreement", "agreementType");
//            headingMap.put("Party Name", "partyName");
//            headingMap.put("Location", "location");
//           
//            
//            // Iterate through the map and append headings and their corresponding data
//            for (Map<String, Object> row : data) {
//                for (Map.Entry<String, String> entry : headingMap.entrySet()) {
//                    String displayHeading = entry.getKey();
//                    String columnName = entry.getValue();
//                    Object value = row.get(columnName);
//                    
//                    emailContent.append("<tr>");
//                    emailContent.append("<th>").append(displayHeading).append("</th>");
//                    emailContent.append("<td>").append(value != null ? value.toString() : "").append("</td>");
//                    emailContent.append("</tr>");
//                }
//            }
//
//
//
//            emailContent.append("</table>");
//            emailContent.append("<p>Kindly confirm the date to ensure timely tracking of expiry/renewal of agreement.</p>");
//            emailContent.append("<p>Kind Regards<br>Legal Team,<br>GHIAL</p>");
//            emailContent.append("<p>PS: This is a system generated e-mail. Please contact the Legal Team.</p>");
//            emailContent.append("</body></html>");
//
//            message.setContent(emailContent.toString(), "text/html");
//
//            Transport.send(message);
//            System.out.println("Email sent successfully.");
//
//        } catch (MessagingException mex) {
//            mex.printStackTrace();
//        }
//    }
//}

//







package Dashboard;

import java.sql.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.mail.Session;
import javax.mail.Transport;

public class EmailNotificationServlet {

    public static void main(String[] args) {
        String dbUrl = "jdbc:sqlserver://localhost:1433;databaseName=Legal";
        String dbUser = "sa";
        String dbPassword = "Lalasa@lalu24";
        
        Connection conn = null;
        CallableStatement stmt = null;

        try {
            // Connect to the database
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // Execute stored procedure
            stmt = conn.prepareCall("{call GetCommercialContractsForEmailNotification}");
            ResultSet rs = stmt.executeQuery();

            // Convert ResultSet to List of Maps
            List<Map<String, Object>> data = resultSetToList(rs);

            // If data exists, send an alert email
            if (!data.isEmpty()) {
                sendEmails(data);
            } else {
                System.out.println("No alerts to send.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private static List<Map<String, Object>> resultSetToList(ResultSet rs) throws SQLException {
        List<Map<String, Object>> list = new ArrayList<>();
        ResultSetMetaData md = rs.getMetaData();
        int columns = md.getColumnCount();

        while (rs.next()) {
            Map<String, Object> row = new HashMap<>(columns);
            for (int i = 1; i <= columns; ++i) {
                row.put(md.getColumnName(i), rs.getObject(i));
            }
            list.add(row);
        }
        return list;
    }

    private static void sendEmails(List<Map<String, Object>> data) {
        String from = "senderexample02@gmail.com";
        String to = "lalasanavya09@gmail.com";
        String host = "smtp.gmail.com";
        final String username = "senderexample02@gmail.com";
        final String password = "gmjh pmtx qdnu skej";

        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.enable", "true");

        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        for (Map<String, Object> row : data) {
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(from));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Alert");

                StringBuilder emailContent = new StringBuilder("<html><body>");
                emailContent.append("<p>Dear Sir/Madam,</p>");
                emailContent.append("<p>This is to bring to your kind notice that we have yet to receive the commencement date for the below mentioned agreement.</p>");
                emailContent.append("<table border='1'>");

                // Define the display headings and their corresponding database column names
                LinkedHashMap<String, String> headingMap = new LinkedHashMap<>();
                headingMap.put("Agreement No", "agreementNo");
                headingMap.put("Nature of Document", "documentNature");
                headingMap.put("Type of Agreement", "agreementType");
                headingMap.put("Party Name", "partyName");
                headingMap.put("Location", "location");
                
                // Append headings and corresponding data for each agreement
                for (Map.Entry<String, String> entry : headingMap.entrySet()) {
                    String displayHeading = entry.getKey();
                    String columnName = entry.getValue();
                    Object value = row.get(columnName);
                    
                    emailContent.append("<tr>");
                    emailContent.append("<th>").append(displayHeading).append("</th>");
                    emailContent.append("<td>").append(value != null ? value.toString() : "").append("</td>");
                    emailContent.append("</tr>");
                }

                emailContent.append("</table>");
                emailContent.append("<p>Kindly confirm the date to ensure timely tracking of expiry/renewal of agreement.</p>");
                emailContent.append("<p>Kind Regards,<br>Legal Team,<br>GHIAL</p>");
                emailContent.append("<p>PS: This is a system generated e-mail. Please contact the Legal Team.</p>");
                emailContent.append("</body></html>");

                message.setContent(emailContent.toString(), "text/html");

                Transport.send(message);
                System.out.println("Email sent successfully for agreement " + row.get("agreementNo"));

            } catch (MessagingException mex) {
                mex.printStackTrace();
            }
        }
    }
}
