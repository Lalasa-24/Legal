<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <style>
        body {
            background-image: url("gmr.png");
            width: 100%;
            background-size: cover;
            margin: 0;
        }
        body::-webkit-scrollbar {
    display: none;
}
        table { 
            border-collapse: collapse;
            width:100%;
            padding:0%;
/*            margin: 10px auto;*/
            font-size:medium;
        }
        th{
            background-color: #003974;
            text-align: center;
            padding:1%;
/*            width:100%;*/
            color:white;
        }
        
         td { 
             text-align: center;
            padding:1%;
             background-color: white }
        tr:nth-child(even) {background-color: #f2f2f2;}
        
        .hidden { display: none; }
/*        body {
           background-image: url("gmr.png");
           width: 100%;
            background-size: cover;
            margin: 0;
        }*/
        h2 {
    color: white;
    background-image: url("heading_background.png");
    background-repeat: no-repeat;
    background-position: center;
    text-align: center;
    padding: 1%;
    width: auto;
    background-size: cover;
}
.hidden {
    display: none;
   
}
         h3 {
            text-align: center;
            color: white;
                
        }
         .heading {
    background-image: linear-gradient(75deg, rgba(0,57,116,0.3), rgba(0,57,116,0.3),rgba(0,57,116,0.3),rgba(0,57,116,0.3));
    position: relative;
    top: -30px;
    background-size: cover;
}

.header {
    display: flex;
    flex: 1;
    flex-wrap: nowrap;
    justify-content: center;
    gap: 1%;
    position: relative;
    top: -7px;
    margin: 0 0 10px 0;
    overflow: auto;
    font-size:small;
}
       .contents {
    display: block;
    border: 1px solid;
    background-image: linear-gradient(75deg, rgba(250,171,83,0.9), rgba(250,171,83,0.9));
    padding: 6px;
    font-size: larger;
    border: none;
    align-content: center;
    border-radius: 10px;
    box-shadow: 5px 5px 10px rgba(0,0,0,0.15);
}
        .content {
            color: white;
        }
         .container {
            width: 50%;
            height: 30%;
            background-image: linear-gradient(75deg, rgba(200,200,200,0.8), rgba(240,240,240,0.8), rgba(220,220,220,0.8));
/*            position: absolute;
            left: 29%;
            right: 50%;*/
/*            padding: 25px 30px;*/
            border-radius: 10px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.15);
            box-align: center;
            margin-left: 25%;
            padding-top: 3%;
        }
        .container form .details {
            display: flex;
            flex-wrap: nowrap;
            flex-direction: row;
            justify-content: center;
            gap:10%;
        }
        select {
            width: 100%;
        }
        .user-details.details input {
            width: 10px;
            height: 20px;
        }
        .details {
            font-size: medium;
        }
        input[type="date"] {
            width: 100%;
        }
        form .select span.details {
            display: flex;
            font-weight: 50;
            margin-bottom: 1px;
        }
         .scrollable-table1 {
            max-height: 400px; 
            overflow-y: auto;
            margin-left: 0; 
           
            
        }
        .scrollable-table1::-webkit-scrollbar 
        { display: none;
        }
        .table23{
            padding:10%;
            
        }
        .table13{
            padding:0%
        }
        /*button {
            background-image: linear-gradient(75deg, rgba(250,171,83,0.7), rgba(0,57,116,1),rgba(250,171,83,0.7));
            width: 30%;
            position: absolute;
            top: 68%;
            left: 32%;
            border: none;
            border-radius: 5px;
            color: white;
            padding: 7px;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            margin: 2px 2px;
            cursor: pointer;
        }
        button:hover {
            background-image: linear-gradient(75deg, rgba(237,28,16,0.8), rgba(237,28,16,0.7), rgba(237,28,16,0.8));
        }*/.toggle{
            background-image: linear-gradient(75deg, rgba(250,171,83,0.9), rgba(250,171,83,0.9));
            padding:5px;
        }
    </style>
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
                <a href="Report.jsp" style="color:rgb(0, 0, 0);">Report</a>
            </div>
            <div class="contents">
                <a href="LoginPage.jsp" style="color:rgb(0, 0, 0);">Logout</a>
            </div>
        </div>
    </div>
</head>
<body>
      <h3>Agreement Details</h3>
    <button class="toggle" onclick='toggleParts()'>Other Fields</button>
    <div class="scrollable-table1">
    <div id='part1' >
        <table border='1' class="table13" >
            <tr>
                <th>Agreement Id</th>
                <th>Agreement No</th>
                <th>Reference Id</th>
                <th>Nature of Agreement</th>
                <th>Type of Agreement</th>
                <th>Agreement Scope</th>
                <th>Name of the party</th>
                <th>Execution Date</th>
                
            </tr>
            <%
                List<Map<String, String>> agreements = (List<Map<String, String>>) request.getAttribute("agreements");
                String contractType = (String) request.getParameter("contractType");
                if (agreements != null) {
                    int serialNumber = 1;
                    for (Map<String, String> agreement : agreements) {
            %>
                        <tr>
                            <td><%= serialNumber++ %></td>
                            <td><%= agreement.get("agreementNo") %></td>
                            <td><%= agreement.get("referenceId") %></td>
                            <td><%= agreement.get("documentNature") %></td>
                            <td><%= agreement.get("agreementType") %></td>
                            <td><%= agreement.get("agreementScope") %></td>
                            <td><%= agreement.get("partyName") %></td>
                            <td><%= agreement.get("executionDate") %></td>
                            
                        </tr>
            <%
                    }
                }
            %>
        </table>
    </div>
    <div id='part2' class='hidden'>
        <table border='1' class="table23">
            <tr>
               
                       <th>Agreement No</th>
                        <th>Expiry Date</th>
                        <th>Commencement Date</th>
                        <th>Commencement Type</th>
                        <th>Department</th>
                        <th>Location</th>
                        <th>Additional List</th>
                        <th>Recipient 1</th>
                        <th>Recipient 2</th>
                        <th>Recipient 3</th>
                        <th>Recipient 4</th>
                        <th>Recipient 5</th>
                        <th>Recipient 6</th>
                        <th>Entry Date</th>
                        <th>Modified By</th>
                        <th>Modified Date</th>
<!--                        <th>Entry Date</th>-->
                        <th>Security Deposits</th>
                        <th>Remarks</th>
                        <th>Agreement Status</th>
                <%
                    if ("commercial".equalsIgnoreCase(contractType)) {
                %>
                        <th>License Fees/ Concession Fee</th>
                        <th>CAM Charges</th>
                        <th>Utility</th>
                        <th>Revenue Share</th>
                        <th>MMG</th>
                        <th>Promotional & Advertisement Charges</th>
                        <th>Loading and unloading Charges</th>
                        <th>Back-of House charges/ Storage Charges</th>
                        <th>Deviation</th>
                <%
                    } else if ("service".equalsIgnoreCase(contractType)) {
                %>
                        <th>Service Charges</th>
                        <th>CAM Charges</th>
                        <th>Utility Charges</th>
                        <th>Performance bank guarantee</th>
                        <th>Retention bank guarantee</th>
                        <th>Advance bank guarantee</th>
                        <th>Defect Liability period</th>
                        <th>Latent Defect Liability period</th>
                        <th>Liquidated Damages</th>
                <%
                    }
                %>
            </tr>
            <%
                if (agreements != null) {
                    for (Map<String, String> agreement : agreements) {
            %>
                        <tr>
                                   <td><%= agreement.get("agreementNo") %></td>
                                   <td><%= agreement.get("expiryDate") %></td>
                                    <td><%= agreement.get("commencementDate") %></td>
                                    <td><%= agreement.get("commencementType") %></td>
                                    <td><%= agreement.get("department") %></td>
                                    <td><%= agreement.get("location") %></td>
                                    <td><%= agreement.get("additionalList") %></td>
                                    <td><%= agreement.get("recipient1") %></td>
                                    <td><%= agreement.get("recipient2") %></td>
                                    <td><%= agreement.get("recipient3") %></td>
                                    <td><%= agreement.get("recipient4") %></td>
                                    <td><%= agreement.get("recipient5") %></td>
                                    <td><%= agreement.get("recipient6") %></td>
                                    <td><%= agreement.get("EntryDate") %></td>
                                    <td><%= agreement.get("modifiedBy") %></td>
                                    <td><%= agreement.get("modifiedDate") %></td>
                                    
                                    <td><%= agreement.get("securityDeposits") %></td>
                                    <td><%= agreement.get("remarks") %></td>
                                    <td><%= agreement.get("aggrementStatus") %></td>
                                     <%
                                if ("commercial".equalsIgnoreCase(contractType)) {
                            %>
                                    <td><%= agreement.get("licenseFees") %></td>
                                    <td><%= agreement.get("camChargesC") %></td>
                                    <td><%= agreement.get("utility") %></td>
                                    <td><%= agreement.get("revenueShare") %></td>
                                    <td><%= agreement.get("mmg") %></td>
                                    <td><%= agreement.get("promotionalCharges") %></td>
                                    <td><%= agreement.get("loading") %></td>
                                    <td><%= agreement.get("backOf") %></td>
                                    <td><%= agreement.get("deviation") %></td>
                            <%
                                } else if ("service".equalsIgnoreCase(contractType)) {
                            %>
                                    <td><%= agreement.get("serviceCharges") %></td>
                                    <td><%= agreement.get("camChargesS") %></td>
                                    <td><%= agreement.get("utilityChargesS") %></td>
                                    <td><%= agreement.get("performanceBG") %></td>
                                    <td><%= agreement.get("retentionBG") %></td>
                                    <td><%= agreement.get("advanceBG") %></td>
                                    <td><%= agreement.get("defectLiability") %></td>
                                    <td><%= agreement.get("latentDefectL") %></td>
                                    <td><%= agreement.get("liquidatedDamages") %></td>
                            <%
                                }
                            %>
                        </tr>
            <%
                    }
                }
            %>
        </table>
    </div>

    </div>
        
        <script>
       function toggleParts() {
    var part1 = document.getElementById("part1");
    var part2 = document.getElementById("part2");
    console.log("part1.style.display:", part1.style.display);
    console.log("part2.style.display:", part2.style.display);
    if (part1.style.display === "none") {
        part1.style.display = "block";
        part2.style.display = "none";
    } else {
        part1.style.display = "none";
        part2.style.display = "block";
    }
}
    </script>
</body>
</html>
