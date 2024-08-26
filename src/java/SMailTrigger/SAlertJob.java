package SMailTrigger;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.util.Date;

public class SAlertJob implements Job {

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        String agreementNo = context.getJobDetail().getJobDataMap().getString("agreementNo");
        String documentNature = context.getJobDetail().getJobDataMap().getString("documentNature");
        String agreementType = context.getJobDetail().getJobDataMap().getString("agreementType");
        String partyName = context.getJobDetail().getJobDataMap().getString("partyName");
        long executionDateLong = context.getJobDetail().getJobDataMap().getLong("executionDate");
        Date executionDate = new Date(executionDateLong);
        String agreementStatus = context.getJobDetail().getJobDataMap().getString("agreementStatus");
        long expiryDateLong = context.getJobDetail().getJobDataMap().getLong("expiryDate");
        Date expiryDate = new Date(expiryDateLong);
        String alertType = context.getJobDetail().getJobDataMap().getString("alertType");

        String subject = "Agreement Expiry Alert!!!!! " + alertType;
         String body = "<html><body>"
                    + "<p>Dear Sir/Madam,\n\n</p>"
                    + "<p>The Below Agreement is Expiring on " + expiryDate + ". Request you to take necessary action.\n\n</p><br>"
                    + "<table border='1'>"
                    + "<tr><th>Agreement ID</th><td>" + agreementNo + "</td></tr>"
                    + "<tr><th>Nature of the Document</th><td>" + documentNature + "</td></tr>"
                    + "<tr><th>Agreement Type</th><td>" + agreementType + "</td></tr>"
                    + "<tr><th>Party Name</th><td>" + partyName + "</td></tr>"
                    + "<tr><th>Execution Date</th><td>" + executionDate + "</td></tr>"
                    + "<tr><th>Expiry Date</th><td>" + expiryDate + "</td></tr>"
                    + "<tr><th>Pending Days</th><td>" + alertType + "</td></tr>"
                    + "<tr><th>Status</th><td>" + agreementStatus + "</td></tr>"
                    + "</table>"
                    + "<p>Kind regards,<br>Legal Team GHIAL</p>"
                    + "<p>PS: This is a system-generated mail. Kindly contact the legal team.</p>"
                    + "</body></html>";

        switch (alertType) {
            case "45 Days Alert":
                SEmailUtil.sendEmail("lalasanavya09@gmail.com", null, subject, body);
                //EmailUtil.sendEmail("R1@example.com,R2@example.com,R3@example.com,R6@example.com", null, subject, body);
                
                break;
            case "30 Days Alert":
                SEmailUtil.sendEmail("navyalalasa@gmail.com", null, subject, body);
                //EmailUtil.sendEmail("DepartmentHOD@example.com", null, subject, body);
                break;
            case "15 Days Alert":
                SEmailUtil.sendEmail("navyalalasa@gmail.com", null, subject, body);
                //EmailUtil.sendEmail("LegalHOD@example.com", null, subject, body);
                break;
            case "7 Days Alert":
                SEmailUtil.sendEmail("navyalalasa@gmail.com", null, subject, body);
                //EmailUtil.sendEmail("CEO@example.com", "CLO@example.com", subject, body);
                break;
            case "Expiry Alert":
                SEmailUtil.sendEmail("lalasanavya09@gmail.com", null, subject, body);
                //EmailUtil.sendEmail("R1@example.com", "CEO@example.com,DepartmentHOD@example.com,R2@example.com,R3@example.com,R4@example.com,R6@example.com", subject, body);
                
                break;
        }
    }
}
