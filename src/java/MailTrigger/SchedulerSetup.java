package MailTrigger;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class SchedulerSetup {

    public static void main(String[] args) throws SchedulerException {
        Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
        scheduler.start();

        List<Contract> contracts = DatabaseUtil.getContracts();

        for (Contract contract : contracts) {
            Date expiryDate = contract.getExpiryDate();
            String agreementNo = contract.getAgreementNo();

            if (expiryDate != null) {
                scheduleJob(scheduler, contract, expiryDate, "45 Days Alert", -45);
                scheduleJob(scheduler, contract, expiryDate, "30 Days Alert", -30);
                scheduleJob(scheduler, contract, expiryDate, "15 Days Alert", -15);
                scheduleJob(scheduler, contract, expiryDate, "7 Days Alert", -7);
                scheduleJob(scheduler, contract, expiryDate, "1 Day Alert", -1); // Expiry alert job
            } else {
                System.out.println("Expiry date not found for agreement number: " + agreementNo);
            }
        }
    }

    private static void scheduleJob(Scheduler scheduler, Contract contract, Date expiryDate, String alertType, int daysBeforeExpiry) throws SchedulerException {
        Calendar cal = Calendar.getInstance();
        cal.setTime(expiryDate);
        cal.add(Calendar.DAY_OF_MONTH, daysBeforeExpiry);

        JobDetail job = JobBuilder.newJob(AlertJob.class)
                .withIdentity(alertType + "_" + contract.getAgreementNo(), "alertGroup")
                .usingJobData("agreementNo", contract.getAgreementNo())
                .usingJobData("expiryDate", expiryDate.getTime())
                .usingJobData("documentNature", contract.getDocumentNature())
                .usingJobData("agreementType", contract.getAgreementType())
                .usingJobData("partyName", contract.getPartyName())
                .usingJobData("executionDate", contract.getExecutionDate().getTime())
                .usingJobData("agreementStatus", contract.getAgreementStatus())
                .usingJobData("alertType", alertType)
                .build();

        Trigger trigger = TriggerBuilder.newTrigger()
                .withIdentity(alertType + "Trigger_" + contract.getAgreementNo(), "alertGroup")
                .startAt(cal.getTime())
                .build();

        scheduler.scheduleJob(job, trigger);
    }
}
