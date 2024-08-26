package SContract;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author navya
 */

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author navya
 */
public class ServiceC 
{
    
 private String agreementNo ,referenceId, documentNature, agreementType, agreementScope, department,partyName,
         executionDate, expiryDate,commencementType,commencementDate, location ,securityDeposits , recipient1,recipient2,recipient3,
         recipient4,recipient5,recipient6,additionalList,uploadFile1,uploadFile2,uploadFile3,uploadFile4,uploadFile5,remarks,
         serviceCharges,camChargesS,utilityChargesS,performanceBG,retentionBG,adavnceBG,defectLiability,
         latentDefectL,liquidatedDamages,contractType, dataEnteredBy;
// public ServiceC() {
// super();
// }
 public ServiceC(String agreementNo, String referenceId, String documentNature, String agreementType,
                String agreementScope, String department, String partyName, String executionDate, String expiryDate,
                String commencementType, String commencementDate, String location, String securityDeposits,
                String recipient1, String recipient2, String recipient3, String recipient4, String recipient5,
                String recipient6, String additionalList, String uploadFile1, String uploadFile2, String uploadFile3,
                String uploadFile4, String uploadFile5, String remarks, String serviceCharges, String camChargesS,
                String utilityChargesS, String performanceBG, String retentionBG, String adavnceBG, String defectLiability,
                String latentDefectL, String liquidatedDamages, String dataEnteredBy) {
    
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
    this.serviceCharges = serviceCharges;
    this.camChargesS = camChargesS;
    this.utilityChargesS = utilityChargesS;
    this.performanceBG = performanceBG;
    this.retentionBG = retentionBG;
    this.adavnceBG = adavnceBG;
    this.defectLiability = defectLiability;
    this.latentDefectL = latentDefectL;
    this.liquidatedDamages = liquidatedDamages;
    this.contractType = "service";  // Assuming this is a service contract
    this.dataEnteredBy = dataEnteredBy;



 
 
 }

 

    

  

  
 public String getagreementNo() {
 return agreementNo;
 }
// public void setagreementNo(String agreementNo) {
// this.agreementNo = agreementNo;
// }
 public String getreferenceId() {
 return referenceId;
 }
// public void setreferenceId(String referenceId) {
// this.referenceId = referenceId;
// }
 public String getdocumentNature() {
 return documentNature;
 }
// public void setdocumentNature(String documentNature) {
// this.documentNature = documentNature;
// }
 public String getagreementType() {
 return agreementType;
 }
// public void setagreementType(String agreementType) {
// this.agreementType = agreementType;
// }
 public String getagreementScope() {
 return agreementScope;
 }
// public void setagreementScope(String agreementScope) {
// this.agreementScope = agreementScope;
// }
 public String getdepartment() {
 return department;
 }
// public void setdepartment(String department) {
// this.department = department;
// }
 public String getpartyName() {
 return partyName;
 }
// public void setpartyName(String partyName) {
// this.partyName = partyName;
// }
 public String getexecutionDate() {
 return executionDate;
 }
// public void setexecutionDate(String executionDate) {
// this.executionDate = executionDate;
// }
 public String getexpiryDate() {
 return expiryDate;
 }
// public void setexpiryDate(String expiryDate) {
// this.expiryDate = expiryDate;
// }
  public String getcommencementType() {
 return commencementType;
 }
// public void setcommencementType(String commencementType) {
// this.commencementType = commencementType;
// }
 public String getcommencementDate() {
 return commencementDate;
 }
// public void setcommencementDate(String commencementDate) {
// this.commencementDate = commencementDate;
// }
  
  public String getlocation() {
 return location;
 }
// public void setlocation(String location) {
// this.location = location;
// }
 public String getsecurityDeposits() {
 return securityDeposits;
 }
// public void setsecurityDeposits(String securityDeposits) {
// this.securityDeposits = securityDeposits;
// }
 public String getrecipient1() {
 return recipient1;
 }
// public void setrecipient1(String recipient1) {
// this.recipient1 = recipient1;
// }
 public String getrecipient2() {
 return recipient2;
 }
// public void setrecipient2(String recipient2) {
// this.recipient2 = recipient2;
// }
 public String getrecipient3() {
 return recipient3;
 }
// public void setrecipient3(String recipient3) {
// this.recipient3 = recipient3;
// }
  public String getrecipient4() {
 return recipient4;
 }
// public void setrecipient4(String recipient4) {
// this.recipient4 = recipient4;
// }
  public String getrecipient5() {
 return recipient5;
 }
// public void setrecipient5(String recipient5) {
// this.recipient5 = recipient5;
// }
  public String getrecipient6() {
 return recipient6;
 }
// public void setrecipient6(String recipient6) {
// this.recipient6 = recipient6;
// }
  public String getadditionalList() {
 return additionalList;
 }
// public void setadditionalList(String additionalList) {
// this.additionalList = additionalList;
// }
  public String getuploadFile1() {
 return uploadFile1;
 }
// public void setuploadFile1(String uploadFile1) {
// this.uploadFile1 = uploadFile1;
// }
  public String getuploadFile2() {
 return uploadFile2;
 }
// public void setuploadFile2(String uploadFile2) {
// this.uploadFile2 = uploadFile2;
// }
public String getuploadFile3() {
 return uploadFile3;
 }
// public void setuploadFile3(String uploadFile3) {
// this.uploadFile3 = uploadFile3;
// }
 public String getuploadFile4() {
 return uploadFile4;
 }
// public void setuploadFile4(String uploadFile4) {
// this.uploadFile4 = uploadFile4;
// }
 public String getuploadFile5() {
 return uploadFile5;
 }
// public void setuploadFile5(String uploadFile5) {
// this.uploadFile5 = uploadFile5;
// }
 public String getremarks() {
 return remarks;
 }
// public void setremarks(String remarks) {
// this.remarks = remarks;
// }
  public String getserviceCharges() {
 return serviceCharges;
 }
// public void setserviceCharges(String serviceCharges) {
// this.serviceCharges = serviceCharges;
// }
  public String getcamChargesS() {
 return camChargesS;
 }
// public void setcamChargesS(String camChargesS) {
// this.camChargesS = camChargesS;
// }
  public String getutilityChargesS() {
 return utilityChargesS;
 }
// public void setutilityChargesS(String utilityChargesS) {
// this.utilityChargesS = utilityChargesS;
// }
  public String getperformanceBG() {
 return performanceBG;
 }
// public void setperformanceBG(String performanceBG) {
// this.performanceBG = performanceBG;
// }
  public String getretentionBG() {
 return retentionBG;
 }
// public void setretentionBG(String retentionBG) {
// this.retentionBG = retentionBG;
// }
  public String getadavnceBG() {
 return adavnceBG;
 }
// public void setadavnceBG(String adavnceBG) {
// this.adavnceBG = adavnceBG;
// }
  public String getdefectLiability() {
 return defectLiability;
 }
// public void setdefectLiability(String defectLiability) {
// this.defectLiability = defectLiability;
// }
  public String getlatentDefectL() {
 return latentDefectL;
 }
// public void setlatentDefectL(String latentDefectL) {
// this.latentDefectL = latentDefectL;
// }
  public String getliquidatedDamages() {
 return liquidatedDamages;
 }
// public void setliquidatedDamages(String liquidatedDamages) {
// this.liquidatedDamages = liquidatedDamages;
// }
 public String getContractType() {
 return contractType;
 }
 public String getdataEnteredBy() {
 return dataEnteredBy;
 }
// public void setcontractType(String contractType) {
// this.contractType = contractType;
// }

//    String getContractType() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
// 


 
}