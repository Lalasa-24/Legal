package CContract;

public class CommercialC {
    private final String agreementNo;
    private final String referenceId;
    private final String documentNature;
    private final String agreementType;
    private final String agreementScope;
    private final String department;
    private final String partyName;
    private final String executionDate;
    private final String expiryDate;
    private final String commencementType;
    private final String commencementDate;
    private final String location;
    private final String securityDeposits;
    private final String recipient1;
    private final String recipient2;
    private final String recipient3;
    private final String recipient4;
    private final String recipient5;
    private final String recipient6;
    private final String additionalList;
    private final String uploadFile1;
    private final String uploadFile2;
    private final String uploadFile3;
    private final String uploadFile4;
    private final String uploadFile5;
    private final String remarks;
    private final String contractType;  // New field
    private final String licenseFees;
    private final String camChargesC;
    private final String utility;
    private final String revenueShare;
    private final String mmg;
    private final String promotionalCharges;
    private final String loading;
    private final String backOf;
    private final String deviation;
    private final String dataEnteredBy;
    

    public CommercialC(String agreementNo, String referenceId, String documentNature, String agreementType, 
                       String agreementScope, String department, String partyName, String executionDate, 
                       String expiryDate,String commencementType, String commencementDate, String location, String securityDeposits, 
                       String recipient1, String recipient2, String recipient3, String recipient4, 
                       String recipient5, String recipient6, String additionalList, String uploadFile1, 
                       String uploadFile2, String uploadFile3, String uploadFile4, String uploadFile5, 
                       String licenseFees, String camChargesC,String utility, String revenueShare, String mmg, String promotionalCharges, 
                       String loading, String backOf, String deviation, String remarks, String dataEnteredBy) {
        this.agreementNo = agreementNo;
        this.referenceId = referenceId;
        this.documentNature = documentNature;
        this.agreementType = agreementType;
        this.agreementScope = agreementScope;
        this.department = department;
        this.partyName = partyName;
        this.executionDate = executionDate;
        this.expiryDate = expiryDate;
        this.commencementType = commencementType;
        this.commencementDate = commencementDate;
        this.location = location;
        this.securityDeposits = securityDeposits;
        this.recipient1 = recipient1;
        this.recipient2 = recipient2;
        this.recipient3 = recipient3;
        this.recipient4 = recipient4;
        this.recipient5 = recipient5;
        this.recipient6 = recipient6;
        this.additionalList = additionalList;
        this.uploadFile1 = uploadFile1;
        this.uploadFile2 = uploadFile2;
        this.uploadFile3 = uploadFile3;
        this.uploadFile4 = uploadFile4;
        this.uploadFile5 = uploadFile5;
        this.remarks = remarks;
        this.contractType = "commercial";  // Set default value
        this.licenseFees = licenseFees;
        this.camChargesC = camChargesC;
        this.utility = utility;
        this.revenueShare = revenueShare;
        this.mmg = mmg;
        this.promotionalCharges = promotionalCharges;
        this.loading = loading;
        this.backOf = backOf;
        this.deviation = deviation;
        this.dataEnteredBy = dataEnteredBy;
        
    }

   

    // Add a getter for contractType
    public String getContractType() {
        return contractType;
    }


    public String getagreementNo() {
        return agreementNo;
    }

    public String getreferenceId() {
        return referenceId;
    }

    public String getdocumentNature() {
        return documentNature;
    }

    public String getagreementType() {
        return agreementType;
    }

    public String getagreementScope() {
        return agreementScope;
    }

    public String getdepartment() {
        return department;
    }

    public String getpartyName() {
        return partyName;
    }

    public String getexecutionDate() {
        return executionDate;
    }

    public String getexpiryDate() {
        return expiryDate;
    }
    public String getcommencementType() {
        return commencementType;
    }
    public String getcommencementDate() {
        return commencementDate;
    }

    public String getlocation() {
        return location;
    }

    public String getsecurityDeposits() {
        return securityDeposits;
    }

    public String getrecipient1() {
        return recipient1;
    }

    public String getrecipient2() {
        return recipient2;
    }

    public String getrecipient3() {
        return recipient3;
    }

    public String getrecipient4() {
        return recipient4;
    }

    public String getrecipient5() {
        return recipient5;
    }

    public String getrecipient6() {
        return recipient6;
    }

    public String getadditionalList() {
        return additionalList;
    }

    public String getuploadFile1() {
        return uploadFile1;
    }

    public String getuploadFile2() {
        return uploadFile2;
    }

    public String getuploadFile3() {
        return uploadFile3;
    }

    public String getuploadFile4() {
        return uploadFile4;
    }

    public String getuploadFile5() {
        return uploadFile5;
    }

   public String getremarks() {
        return remarks;
    }
    public String getlicenseFees() {
        return licenseFees;
    }
     public String getcamChargesC() {
        return camChargesC;
    }
      public String getutility() {
        return utility;
    }
       public String getrevenueShare() {
        return revenueShare;
    }
        public String getmmg() {
        return mmg;
    }
         public String getpromotionalCharges() {
        return promotionalCharges;
    }
          public String getloading() {
        return loading;
    }
           public String getbackOf() {
        return backOf;
    }
            public String getdeviation() {
        return deviation;
    }
                public String getdataEnteredBy() {
        return dataEnteredBy;
    }
   
}
