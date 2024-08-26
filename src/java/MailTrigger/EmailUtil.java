package MailTrigger;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailUtil {

    public static void sendEmail(String to, String cc, String subject, String body) {
        String from = "senderexample02@gmail.com";
        String host = "smtp.gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "465"); // or 587 for TLS
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true"); // for SSL

        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("senderexample02@gmail.com", "gmjh pmtx qdnu skej");
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            if (cc != null && !cc.isEmpty()) {
                message.addRecipient(Message.RecipientType.CC, new InternetAddress(cc));
            }
             message.setSubject(subject);
           message.setContent(body, "text/html; charset=utf-8");
//            message.setText(body);

            Transport.send(message);
            System.out.println("Email sent successfully.");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }

    

    static void sendEmail(String navyalalasagmailcom, Object object, String subject, String body, String texthtml) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
