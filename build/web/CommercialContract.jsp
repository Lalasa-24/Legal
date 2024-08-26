<%-- 
    Document   : CommercialC
    Created on : 30 Apr, 2024, 10:59:06 AM
    Author     : navya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String insertionResult = (String) request.getAttribute("insertionResult"); 
    if (insertionResult != null) {
%>
<script>
    alert("<%= insertionResult %>");
</script>
<%
    }
%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8" /> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
     <link rel="stylesheet" type="text/css" href="css/commercialContract.css"> 
        <title>Commercial-Contract</title>
         
         
        <div class="heading">
            
            <h2>GHIAL Legal Agreements Tracking System</h2>
        <div class="header">
            <div class="contents">
            <a href="Dashboard.jsp" style="color:rgb(0, 0, 0);">Dashboard</a>
        </div>
        <div class="contents">
            <a href="CommercialContract.jsp" style="color:rgb(0, 0, 0);">New Commercial Contract</a>
        </div>
        <div class="contents">
            <a href="ServiceContract.jsp" style="color:rgb(0, 0, 0);">New Service contact</a>
        </div>
        <div class="contents">
            <a href="CommercialAgreements.jsp" style="color:rgb(0, 0, 0);">Commercial Agreements List</a>
        </div>
        <div class="contents">
            <a href="ServiceAgreements.jsp" style="color:rgb(0, 0, 0);">Service Agreements List</a>
        </div>
        <div class="contents">
            <a href="Report.jsp" style="color:rgb(0, 0, 0);" >Report</a>
        </div>
        <div class="contents">
            <a href="LoginPage.jsp" style="color:rgb(0, 0, 0);">Logout</a>
        </div>
        </div>
        </div>

</head>
   
    <body>
        
        
        <form id="myForm" class="form" action="CommercialCServlet" method="post" enctype="multipart/form-data">
            <div id="page1" class="page active">
                <h3 style="text-align: center">LEGAL AGREEMENTS TRACKER-COMMERCIAL</h3>
                
                <div class="details">
                    <div class="user-details">
                        <span class="details">Enter Agreement Number*</span>
                        <input type="text" name="agreementNo"size="40" required>
                    </div>
                    <div class="user-details">
                        <span class="details">Referene ID*</span>
                        <input type="text" name="referenceId"size="40" required>
                    </div>
                    <div class="user-details">
                        <span class="details" >Nature of the Document*</span>
                        <select id="opt" name="documentNature" required>
                            <option value="select" >select</option>
                            <option value="Amendatory Agreement">Amendatory Agreement</option>
                            <option value="Extension" >Extension</option>
                            <option value="Main Agreement" >Main Agreement</option>
                            <option value="Navigation" >Navigation</option>
                            <option value="Supplementary Agreement" >Supplementary Agreement</option>
                            <option value="Termination Letter" >Termination Letter</option>
                            <option value="Others" >Others</option>
                        </select>
                    </div>    
                    <div class="user-details">
                        <span class="details">Type of the Agreement*</span>
                        <select id="opt" name="agreementType" required>
                            <option value="select">Select</option>
                            <option value="Concession Agreement" >Concession Agreement</option>
                            <option value="License Agreement" >License Agreement</option>
                            <option value="MOC" >MOU</option>
                            <option value="NDA" >NDA</option>
                            <option value="Novation Agreement" >Novation Agreement</option>
                            <option value="Utility Agreement" >Utility Agreement</option>
                            <option value="Lease Dead" >Lease Deed</option>
                            <option value="Sub Lease Dead" >Sub Lease Deed</option>
                            <option value="Conveyance Dead" >Conveyance Deed</option>
                            <option value="Agreement" >Agreement</option>
                            <option value="Letter" >Letter</option>
                            <option value="LOPT" >LOPT</option>
                            <option value="LOA" >LOA</option>
                            <option value="Others" >Others</option>
                        </select>
                    </div>
                    <div class="user-details">
                        <span class="details">Scope of the Agreement*</span>
                        <input type="text" name="agreementScope" size="40" required>
                    </div>
                    <div class="user-details">
                        <span class="details">Department*</span>
                        <select id="opt"name="department" required>
                            <option value="select">select</option>
                            <option value="Aero">Aero</option>
                            <option value="Airside OPerations">Airside Operations</option>
                            <option value="APOC">APOC</option>
                            <option value="Business excellence">Business excellence</option>
                            <option value="CFL">CFL</option>
                            <option value="Corp Communication">Corp Communication</option>
                            <option value="Duty freet">Duty freet</option>
                            <option value="Environment">Environment</option>
                            <option value="Estate Management">Estate Management</option>
                            <option value="Finace">Finace</option>
                            <option value="FMS">FMS</option>
                            <option value="HR">HR</option>
                            <option value="Innovex">Innovex</option>
                            <option value="IPD">IPD</option>
                            <option value="IT">IT</option>
                            <option value="Non-Aero">Non-Aero</option>
                            <option value="P&C">P&C</option>
                            <option value="Projects">Projects</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="user-details">
                        <span class="details">Party Name*</span>
                        <input type="text" name="partyName" size="40" required>
                    </div>
                    <div class="user-details">
                        <span class="details">Execution date*</span>
                        <input type="date"name="executionDate" size="40" required>
                    </div>
                    <div class="user-details">
                        <span class="details">Expiry Date*</span>
                        <input type="date" name="expiryDate" size="40" required>
                    </div>
                     <div class="user-details">
                        <span class="details" >Commencement Type*</span>
                        <select id="opt" name="commencementType" required>
                            <option value="select" >select</option>
                            <option value="Tentative">Tentative</option>
                            <option value="Fixed" >Fixed</option>
                         </select>
                    </div> 
                    <div class="user-details">
                        <span class="details">Commencement date*</span>
                        <input type="date" name="commencementDate" size="40" required>
                    </div>
                    <div class="user-details">
                        <span class="details">Location</span>
                        <input type="text" name="location" size="40" >
                    </div>
<!--                    <div class="page-details">-->
                    <div class="user-details">
                        <span class="details">Security Deposits</span>
                        <input type="text" name="securityDeposits" size="40">
                    </div>
                <div class="user-details">
                    <span class="details">Recipient1(Business-SPOC-1)*</span>
                    <select id="opti" name="recipient1" required>
                        <option value="select">select</option>
                        <option value="10189">10189</option>
                        <option value="5605">5605</option>
                        <option value="11003">11003</option>
                        <option value="1870">1870</option>
                        <option value="7505">7505</option>
                        <option value="21180">21180</option>
                        <option value="20219">20219</option>
                        <option value="4968">4968</option>
                        <option value="17338">17338</option>
                    </select><br>
                </div>
                <div class="user-details">
                    <span class="details">Recipient2(Business-SPOC-2)*</span>
                    <select id="opti"name="recipient2"required>
                         <option value="select">select</option>
                        <option value="10189">10189</option>
                        <option value="5605">5605</option>
                        <option value="11003">11003</option>
                        <option value="1870">1870</option>
                        <option value="7505">7505</option>
                        <option value="21180">21180</option>
                        <option value="20219">20219</option>
                        <option value="4968">4968</option>
                        <option value="17338">17338</option>
                   </select><br>
                </div>
                <div class="user-details">
                    <span class="details">Recipient3(Legal-SPOC)*</span>
                    <select id="opti"name="recipient3"required>
                         <option value="select">select</option>
                        <option value="10189">10189</option>
                        <option value="5605">5605</option>
                        <option value="11003">11003</option>
                        <option value="1870">1870</option>
                        <option value="7505">7505</option>
                        <option value="21180">21180</option>
                        <option value="20219">20219</option>
                        <option value="4968">4968</option>
                        <option value="17338">17338</option>
                   </select><br>
                </div>
                <div class="user-details">
                    <span class="details">Recipient4(Business-HOD)*</span>
                    <select id="opti"name="recipient4"required>
                         <option value="select">select</option>
                        <option value="10189">10189</option>
                        <option value="5605">5605</option>
                        <option value="11003">11003</option>
                        <option value="1870">1870</option>
                        <option value="7505">7505</option>
                        <option value="21180">21180</option>
                        <option value="20219">20219</option>
                        <option value="4968">4968</option>
                        <option value="17338">17338</option>
                   </select><br>
                </div>
                <div class="user-details">
                    <span class="details">Recipient5(Business-HODD)*</span>
                    <select id="opti"name="recipient5"required>
                        <option value="select">select</option>
                        <option value="10189">10189</option>
                        <option value="5605">5605</option>
                        <option value="11003">11003</option>
                        <option value="1870">1870</option>
                        <option value="7505">7505</option>
                        <option value="21180">21180</option>
                        <option value="20219">20219</option>
                        <option value="4968">4968</option>
                        <option value="17338">17338</option>
                   </select><br>
                </div>
                <div class="user-details">
                    <span class="details">Recipient6</span>
                    <select id="opti"name="recipient6">
                         <option value="select">select</option>
                        <option value="10189">10189</option>
                        <option value="5605">5605</option>
                        <option value="11003">11003</option>
                        <option value="1870">1870</option>
                        <option value="7505">7505</option>
                        <option value="21180">21180</option>
                        <option value="20219">20219</option>
                        <option value="4968">4968</option>
                        <option value="17338">17338</option>
                   </select><br>
                </div>
                <!--<div class="user-details">
                    <span class="details">Additional CC List</span>
                    <input type="text" name="additionalList" size="40">
                </div>-->
                <div class="user-details">
                    <span class="details">Upload File*</span>
                    <input type="file"  id="upload" name="uploadFile1"  title="Upload only PDF File" required/>
                </div>
                <div class="user-details">
                    <span class="details">Upload File</span>
                    <input type="file"  id="upload" name="uploadFile2"  title="Upload only PDF File" />
                </div>
                <div class="user-details">
                    <span class="details">Upload File</span>
                    <input type="file" id="upload" name="uploadFile3" title="Upload only PDF File" />
                </div>
                <div class="user-details">
                    <span class="details">Upload File</span>
                    <input type="file"  id="upload" name="uploadFile4"  title="Upload only PDF File" />
                </div>
                <div class="user-details">
                    <span class="details">Upload File</span>
                    <input type="file"  id="upload" name="uploadFile5"  title="Upload only PDF File" />
                </div>
                <div class="user-details">
                    <span class="details">Remarks</span> 
                    <textarea id="id_remarks" name="remarks" rows="auto" cols="auto" autocomplete="off" size="200" value=""></textarea>
                </div> 
                  <button class="next" type="button" onclick="showPage('page2')">Next</button>
                </div>
                
            </div>
      
            <div id="page2" class="page">
                <h3 style="text-align: center">LEGAL AGREEMENTS TRACKER-SERVICE</h3>
                <div class="flex-container">  
    <div class="user-details2">  
        <span class="details2">License Fees/ Concession Fee</span>  
        <textarea id="id_remarks_1" name="licenseFees" rows="auto" cols="auto" autocomplete="off" oninput="checkWordLimit()"></textarea>  
        <div id="wordCountMessage_1" class="word-count-message">You have exceeded the 30-word limit.</div>  
    </div>  

    <div class="user-details2">  
        <span class="details2">CAM Charges</span>  
        <textarea id="id_remarks_2" name="camChargesC" rows="auto" cols="auto" autocomplete="off" oninput="checkWordLimit()"></textarea>  
        <div id="wordCountMessage_2" class="word-count-message">You have exceeded the 30-word limit.</div>  
    </div>  

    <div class="user-details2">  
        <span class="details2">Utility</span>  
        <textarea id="id_remarks_3" name="utility" rows="auto" cols="auto" autocomplete="off" oninput="checkWordLimit()"></textarea>  
        <div id="wordCountMessage_3" class="word-count-message">You have exceeded the 30-word limit.</div>  
    </div>   

    <div class="user-details2">  
        <span class="details2">Revenue Share</span>  
        <textarea id="id_remarks_4" name="revenueShare" rows="auto" cols="auto" autocomplete="off" oninput="checkWordLimit()"></textarea>  
        <div id="wordCountMessage_4" class="word-count-message">You have exceeded the 30-word limit.</div>  
    </div>   

    <div class="user-details2">  
        <span class="details2">MMG</span>  
        <textarea id="id_remarks_5" name="mmg" rows="auto" cols="auto" autocomplete="off" oninput="checkWordLimit()"></textarea>  
        <div id="wordCountMessage_5" class="word-count-message">You have exceeded the 30-word limit.</div>  
    </div>   

    <div class="user-details2">  
        <span class="details2">Promotional & Advertisement Charges</span>  
        <textarea id="id_remarks_6" name="promotionalCharges" rows="auto" cols="auto" autocomplete="off" oninput="checkWordLimit()"></textarea>  
        <div id="wordCountMessage_6" class="word-count-message">You have exceeded the 30-word limit.</div>  
    </div>   

    <div class="user-details2">  
        <span class="details2">Loading and Unloading Charges</span>  
        <textarea id="id_remarks_7" name="loading" rows="auto" cols="auto" autocomplete="off" oninput="checkWordLimit()"></textarea>  
        <div id="wordCountMessage_7" class="word-count-message">You have exceeded the 30-word limit.</div>  
    </div>   

    <div class="user-details2">  
        <span class="details2">Back-of House Charges/Storage Charges</span>  
        <textarea id="id_remarks_8" name="backOf" rows="auto" cols="auto" autocomplete="off" oninput="checkWordLimit()"></textarea>  
        <div id="wordCountMessage_8" class="word-count-message">You have exceeded the 30-word limit.</div>  
    </div>   

              
               <div class="user-details2">
                    <span class="details2">Deviation</span> 
                    <textarea id="id_remarks_9" name="deviation" rows="auto" cols="auto" autocomplete="off" oninput="checkWordLimit()"></textarea>  
        <div id="wordCountMessage_9" class="word-count-message">You have exceeded the 30-word limit.</div>  
          </div>
                </div>   <div class="flex">
                <button class="previous" type="button" onclick="showPage('page1')">Previous</button>
                <button class="submit" type="submit" onclick="submitForm()">Submit</button></div>
                
             
            </div>
       
       </form>
        <script>
        document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('myForm').addEventListener('submit', function(event) {
        var formIsValid = validateForm();
        if (!formIsValid) {
            event.preventDefault();
        }
    });
});
function checkWordLimit(textareaId, limit, messageId) {
    const textarea = document.getElementById(textareaId);
    const wordCountMessage = document.getElementById(messageId);
    
    // Split the text by spaces to count the words
    const words = textarea.value.trim().split(/\s+/);
    
    // Check the number of words
    if (words.length > limit) {
        // If the limit is exceeded, trim the text to the allowed limit
        textarea.value = words.slice(0, limit).join(' ');
        wordCountMessage.style.display = 'block'; // Show warning message
    } else {
        wordCountMessage.style.display = 'none'; // Hide warning message
    }
}

// Attach the checkWordLimit function to each textarea with appropriate limits
document.getElementById('id_remarks_1').oninput = function() {
    checkWordLimit('id_remarks_1', 30, 'wordCountMessage_1');
};
document.getElementById('id_remarks_2').oninput = function() {
    checkWordLimit('id_remarks_2', 30, 'wordCountMessage_2');
};
document.getElementById('id_remarks_3').oninput = function() {
    checkWordLimit('id_remarks_3', 30, 'wordCountMessage_3');
};
document.getElementById('id_remarks_4').oninput = function() {
    checkWordLimit('id_remarks_4', 30, 'wordCountMessage_4');
};
document.getElementById('id_remarks_5').oninput = function() {
    checkWordLimit('id_remarks_5', 100, 'wordCountMessage_5');
};
document.getElementById('id_remarks_6').oninput = function() {
    checkWordLimit('id_remarks_6', 30, 'wordCountMessage_6');
};
document.getElementById('id_remarks_7').oninput = function() {
    checkWordLimit('id_remarks_7', 30, 'wordCountMessage_7');
};
document.getElementById('id_remarks_8').oninput = function() {
    checkWordLimit('id_remarks_8', 30, 'wordCountMessage_8'); // 1000-word limit for Deviation textarea
};
document.getElementById('id_remarks_9').oninput = function() {
    checkWordLimit('id_remarks_9', 1000, 'wordCountMessage_9'); // 1000-word limit for Deviation textarea
};

function validateForm() {
    var formInputs = document.querySelectorAll('input[required], select[required], textarea[required]');
    var formIsValid = true;

    for (var i = 0; i < formInputs.length; i++) {
        // Check for select elements, ensure they are not just the default 'select' value
        if (formInputs[i].tagName === 'SELECT' && formInputs[i].value === 'select') {
            alert('Please select a valid option in required fields.');
            formIsValid = false;
            break;
        }

        if (formInputs[i].value.trim() === '') {
            
            console.log('Validation failed on:', formInputs[i]);
            formIsValid = false;
            break;
        }
    }

    return formIsValid;
}

var currentPage = 'page1'; // Initialize currentPage with the ID of the first page

function showPage(pageId) {
    var pages = document.querySelectorAll('.page');
    pages.forEach(function(page) {
        page.style.display = 'none';
    });

    var selectedPage = document.getElementById(pageId);
    selectedPage.style.display = 'block';
    
    currentPage = pageId; // Update the currentPage variable
    console.log("Current Page:", currentPage); // Log the current page ID for debugging
}

function submitForm() {
    if (currentPage === 'page2') {
        var formIsValid = validateForm();
        if (formIsValid) {
            document.getElementById('myForm').submit();
            alert("Form submitted successfully");
        } else {
            alert("Please fill out all required* fields before submitting.");
        }
    } else {
        alert("Please complete all fields in the current section before proceeding.");
    }
}

    </script>
       
    </body>
</html>
