<!DOCTYPE html>
<html>
<head>
    <title>Report</title>
      <meta charset="UTF-8" /> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
     <link rel="stylesheet" type="text/css" href="css/report.css"> 
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
                <a href="logout" style="color:rgb(0, 0, 0);">Logout</a>
            </div>
        </div>
    </div>
</head>
<body>
    <h3>REPORT</h3>
    <div class="container">
        <form action="ReportsServlet" method="post">
            <div class="details">
                <div class="user-details">
                    <span class="details">Execution Date</span>
                    <input type="date" name="executionDate" size="40">
                </div>
                <div class="user-details">
                    <span class="details">Expiry Date</span>
                    <input type="date" name="expiryDate" size="40">
                </div>
                <div class="user-details">
                    <span class="details">Contract Type</span>
                    <select id="option" name="contractType" required>
                        
                        <option value="Service">Service</option>
                        <option value="Commercial">Commercial</option>
                    </select>
                </div>
            </div>
            <br><br>
            <button type="submit">Submit</button>
        </form>
        <form action="ReportServlet" method="get">
             <div id="agreementDetails"></div>
        </form>
    </div>
    <script>
             
            function agreementDetails() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "ReportServlet", true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                document.getElementById("agreementDetails").innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }
           function toggleParts() {
    var part1 = document.getElementById('part1');
    var part2 = document.getElementById('part2');
    if (part1.style.display === 'none') {
        part1.style.display = 'block';
        part2.style.display = 'none';
    } else {
        part1.style.display = 'none';
        part2.style.display = 'block';
    }
} 
          </script>
</body>
</html>
