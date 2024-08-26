package MailTrigger;

import java.util.Date;

public class Contract {
    private String agreementNo;
    private Date expiryDate;
    private String documentNature;
    private String agreementType;
    private String partyName;
    private Date executionDate;
    private String agreementStatus;

    public Contract(String agreementNo, Date expiryDate, String documentNature, String agreementType, String partyName, Date executionDate, String agreementStatus) {
        this.agreementNo = agreementNo;
        this.expiryDate = expiryDate;
        this.documentNature = documentNature;
        this.agreementType = agreementType;
        this.partyName = partyName;
        this.executionDate = executionDate;
        this.agreementStatus = agreementStatus;
    }

    public String getAgreementNo() {
        return agreementNo;
    }

    public void setAgreementNo(String agreementNo) {
        this.agreementNo = agreementNo;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getDocumentNature() {
        return documentNature;
    }

    public void setDocumentNature(String documentNature) {
        this.documentNature = documentNature;
    }

    public String getAgreementType() {
        return agreementType;
    }

    public void setAgreementType(String agreementType) {
        this.agreementType = agreementType;
    }

    public String getPartyName() {
        return partyName;
    }

    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

    public Date getExecutionDate() {
        return executionDate;
    }

    public void setExecutionDate(Date executionDate) {
        this.executionDate = executionDate;
    }

    public String getAgreementStatus() {
        return agreementStatus;
    }

    public void setAgreementStatus(String agreementStatus) {
        this.agreementStatus = agreementStatus;
    }
}
