<%-- 
    Document   : ServiceAgremments
    Created on : 24 Apr, 2024, 1:07:25 PM
    Author     : navya
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" type="text/css" href="css/serviceAgreements.css">
        <title>Service-Agreements</title>
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
    <body onload="agreementDetails()">
        <form id="myForm" action="SAgreement" method="get">
            <div id="fixed">
                <h3>THE FOLLOWING SERVICE AGREEMENTS ARE IN OPEN STATE</h3>
</div>
        </form>
                <div class="content">
            <form action="SSearchServlet" method="get">
                <input class="input" type="text" name="searchInput" placeholder="Enter search term..." required><br><br>
           <button class="button" type="submit">Search</button>
           </form>
            </div>
        <div class="scrollable-table"> 
            <div id="agreementDetails"></div>
        <script>
             
            function agreementDetails() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "SAgreement", true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                document.getElementById("agreementDetails").innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }
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
          




