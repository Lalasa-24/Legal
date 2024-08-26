<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="CAgreement.DownloadFile" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Commercial-Agreements</title>
    <style>
          body {
            background-image: url("gmr.png");
            width: 100%;
            background-size: cover;
            margin: 0;
        }
        body::-webkit-scrollbar
        { display: none;
        }
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
        a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: none;
    
}
 .table1 {  
        border-collapse: collapse; /* Prevents space between cell borders */  
        /* Add margin around the entire table */  
    }  
    .table1 th, .table1 td {  
        padding: 10px; /* Optional: this is cell padding */  
        border: 1px solid black; /* Optional: adds a border for visibility */  
    }  
        .heading {
            background-image: linear-gradient(75deg, rgba(0,57,116,0.3), rgba(0,57,116,0.3),rgba(0,57,116,0.3),rgba(0,57,116,0.3));
            position: relative;
            top: -30px;
            background-size: cover;
        }
        .header {
/*            display: flex;
            flex:1;
            flex-wrap: wrap;
            justify-content: space-between;
            padding: 5px 200px;
            position: relative;
            top: -7px;
            margin: 0px 0px 10px 0px;*/

    display: flex;
    flex: 1;
    flex-wrap: nowrap; /* Prevent wrapping */
    justify-content: center;
    gap:1%;
/*    padding-left: 6% ;
    padding-right: 6% ;*/
    position: relative;
    top: -7px;
    margin: 0 0 10px 0;
    overflow: auto; /* Add this to allow scrolling if necessary */
}

        
        .contents {
            display: block;
            width: auto;
            height: auto;
            border: 1px solid;
            background-image: linear-gradient(75deg, rgba(250,171,83,0.9), rgba(250,171,83,0.9));
            padding: 0.3em; /*rem or em */
            font-size: medium;
            border: none;
            align-content: center;
            border-radius: 10px;
            box-shadow: 5px 5px 10px rgba(0,0,0,0.15);
        }
        h3 {
            color: white;
            text-align: center;
/*            -webkit-text-stroke: 1px white; 
            text-stroke: 1px rgb(0,57,116);*/
/*            font-size:25px;*/
            margin-top:-2%;
            
        }
/*        .content {
            margin-left: 38%;
            width: 100%;
            max-width: 150px;
            text-align: center;
        }*/
/*        #searchInput {
            width: 250%;
           
        }*/
        .container {
            color: white;
            font-size: medium;
            width: 50px;
            margin-left: 750px;
            border-radius: 15%;
            background-image: linear-gradient(75deg,rgba(250,171,83,0.7), rgba(0,57,116,1),rgba(250,171,83,0.7));
        }
        th{
        background-color: #003974;
        border: 1px ridge black;
        border-collapse: collapse;
        color:white;
        font-size: small;
       
        }table{
           width:100%; 
         
        }
        
        table,  td {
            border: 1px ridge black;
            
            border-collapse: collapse;
            
        }
         td {
            background-color: white;
            font-size: small;
            
        }
        
        .button {
            color: white;
            font-size: medium;
            width:12%;
            margin-left: 44%;
            border-radius: 20px;;
            background-image: linear-gradient(75deg,rgba(250,171,83,0.7), rgba(0,57,116,1),rgba(250,171,83,0.7));
        }
        button{
            background-color: #faab53;
            padding:2px;
        }
        .input{
            color: black;
            font-size: medium;
            width: 20%;
            margin-left: 40%;
            border-radius: 1px;;
            background-color: white;}
        
        .scrollable-table {
            max-height: 400px; 
            overflow-y: auto;
            margin-left: 0; 
           
            
        }
        .scrollable-table::-webkit-scrollbar 
        { display: none;
        }
        .table{
            padding:7%;
        }


    </style>
    <div class="heading">
        <h2>GHIAL Legal Agreements Tracking System</h2>
        <div class="header">
            <div class="contents">
                <a href="Dashboard.jsp" style="color: rgb(0, 0, 0);">Dashboard</a>
            </div>
            <div class="contents">
                <a href="CommercialContract.jsp" style="color: rgb(0, 0, 0);">New Commercial Contract</a>
            </div>
            <div class="contents">
                <a href="ServiceContract.jsp" style="color: rgb(0, 0, 0);">New Service contact</a>
            </div>
            <div class="contents">
                <a href="CommercialAgreements.jsp" style="color: rgb(0, 0, 0);">Commercial Agreements List</a>
            </div>
            <div class="contents">
                <a href="ServiceAgreements.jsp" style="color: rgb(0, 0, 0);">Service Agreements List</a>
            </div>
            <div class="contents">
                <a href="Report.jsp" style="color: rgb(0, 0, 0);">Report</a>
            </div>
            <div class="contents">
                <a href="LoginPage.jsp" style="color: rgb(0, 0, 0);">Logout</a>
            </div>
        </div>
    </div>
</head>
<body>
    <h3>Commercial Search Results</h3>
    <button style="text-align:right"
            onclick="toggleParts()">Other Fields</button>
    <div class="scrollable-table">
        <div id="part1">
            <% if (request.getAttribute("noResults") != null) { %>
                <p>No results found</p>
            <% } else { 
                List<Map<String, String>> part1Results = (List<Map<String, String>>) request.getAttribute("part1Results");
                if (part1Results != null && !part1Results.isEmpty()) {
            %>
                <table border="1" class="table1">
                    <thead>
                        <tr>
                            <th>Agreement No</th>
                            <th>Reference ID</th>
                            <th>Document Nature</th>
                            <th>Agreement Type</th>
                            <th>Agreement Scope</th>
                            <th>Party Name</th>
                            <th>Execution Date</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Map<String, String> row : part1Results) { %>
                            <tr>
                                <td><%= row.get("agreementNo") %></td>
                                <td><%= row.get("referenceId") %></td>
                                <td><%= row.get("documentNature") %></td>
                                <td><%= row.get("agreementType") %></td>
                                <td><%= row.get("agreementScope") %></td>
                                <td><%= row.get("partyName") %></td>
                                <td><%= row.get("executionDate") %></td>
                                
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <p>No results found</p>
            <% } } %>
        </div>
        <div id="part2" class="hidden">
            <% if (request.getAttribute("noResults") == null) { 
                List<Map<String, String>> part2Results = (List<Map<String, String>>) request.getAttribute("part2Results");
                if (part2Results != null && !part2Results.isEmpty()) {
            %>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Agreement No</th>
                            <th>Expiry Date</th>
                            <th>Commencement Date</th>
                            <th>Commencement Type</th>
                            <th>Department</th>
                            <th>Recipient 1</th>
                            <th>Recipient 2</th>
                            <th>Recipient 3</th>
                            <th>Recipient 4</th>
                            <th>Recipient 5</th>
                            <th>Recipient 6</th>
                            <th>Upload File 1</th>
                            <th>Upload File 2</th>
                            <th>Upload File 3</th>
                            <th>Upload File 4</th>
                            <th>Upload File 5</th>
<!--                            <th>Upload File 6</th>-->
                            <th>Location</th>
                            <th>Security Deposits</th>
                            <th>Additional List</th>
                            <th>Modified By</th>
                            <th>Entry Date</th>
                            <th>Modified Date</th>
                            <th>License Fees</th>
                            <th>Cam Charges</th>
                            <th>Utility</th>
                            <th>Revenue Share</th>
                            <th>MMG</th>
                            <th>Promotional & Advertisement Charges</th>
                            <th>Loading and unloading Charges</th>
                            <th>Back-of House Charges/ Storage Charges </th>
                            <th>Deviation</th>
                            <th>Remarks</th>
                            <th>Agreement Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Map<String, String> row : part2Results) { %>
                            <tr>
                                <td><%= row.get("agreementNo") %></td>
                                <td><%= row.get("expiryDate") %></td>
                                <td><%= row.get("commencementDate") %></td>
                                <td><%= row.get("commencementType") %></td>
                                <td><%= row.get("department") %></td>
                                <td><%= row.get("recipient1") %></td>
                                <td><%= row.get("recipient2") %></td>
                                <td><%= row.get("recipient3") %></td>
                                <td><%= row.get("recipient4") %></td>
                                <td><%= row.get("recipient5") %></td>
                                <td><%= row.get("recipient6") %></td>
                                <td><a href='DownloadFile?fileName=<%= row.get("uploadFile1") %>'><%= row.get("uploadFile1") %></a></td>
                                <td><a href='DownloadFile?fileName=<%= row.get("uploadFile2") %>'><%= row.get("uploadFile2") %></a></td>
                                <td><a href='DownloadFile?fileName=<%= row.get("uploadFile3") %>'><%= row.get("uploadFile3") %></a></td>
                                <td><a href='DownloadFile?fileName=<%= row.get("uploadFile4") %>'><%= row.get("uploadFile4") %></a></td>
                                <td><a href='DownloadFile?fileName=<%= row.get("uploadFile5") %>'><%= row.get("uploadFile5") %></a></td>
                                <td><%= row.get("location") %></td>
                                <td><%= row.get("securityDeposits") %></td>
                                <td><%= row.get("additionalList") %></td>
                                <td><%= row.get("modifiedBy") %></td>
                                <td><%= row.get("EntryDate") %></td>
                                <td><%= row.get("modifiedDate") %></td>
                                <td><%= row.get("licenseFees") %></td>
                                <td><%= row.get("camChargesC") %></td>
                                <td><%= row.get("utility") %></td>
                                <td><%= row.get("revenueShare") %></td>
                                <td><%= row.get("mmg") %></td>
                                <td><%= row.get("promotionalCharges") %></td>
                                <td><%= row.get("loading") %></td>
                                <td><%= row.get("backOf") %></td>
                                <td><%= row.get("deviation") %></td>
                                <td><%= row.get("remarks") %></td>
                                <td><%= row.get("agreementStatus") %></td>
                                
                                
                                
                                
                             
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <p>No results found</p>
            <% } } %>
        </div>
    </div>
    <script>
        function toggleParts() {
            var part1 = document.getElementById("part1");
            var part2 = document.getElementById("part2");
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
