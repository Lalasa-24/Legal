<%-- 
    Document   : MainPage
    Created on : 24 Apr, 2024, 12:13:24 PM
    Author     : navya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Main Page</title>
        <style>
            body{
    background-image: url("gmr.png");
    width:100%;
    background-size: cover;
    margin:0;
    
}
h1{
    color:white;
    background-image : url("heading_background.png");
    background-repeat: no-repeat;
    background-position: center;
    text-align:center;
    padding:1%;
    width:auto;
    padding:1%;
    width:auto;
    text-align: center;
    background-size: cover
}
.hidden{
    display: none;

}
 
.heading{
    background-image: linear-gradient(75deg, rgba(0,57,116,0.3), rgba(0,57,116,0.3),rgba(0,57,116,0.3),rgba(0,57,116,0.3));
    position: relative;
    top:-30px;
    background-size: cover;
}

.header{
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    padding:5px 200px;
    position: relative;
    top:-7px;
    margin: 0px 0px 10px 0px;
}
.contents{
    display: block;
    width: auto;
    height: auto;
    border: 1px solid ;
    background-image:linear-gradient(75deg, rgba(250,171,83,0,8), rgba(250,171,83,0.8));
    padding: 6px;
    font-size: larger;
    border:none;
    align-content: center;
    border-radius:10%;
    box-shadow: 5px 5px 10px rgba(0,0,0,0.15);
   
}
h2{
    color: rgb(0,57,116);
    text-align: center;
}
.content{ 
    margin-left: 38%;
    width: 100%;
    max-width: 150px;
    
    text-align: center; 
  }
#search{
    width:250%;
    border-radius: 10%;
}
#excel{
    color:white;
    font-size: medium;
    width:60%;
    margin-left: 100%;
    border-radius: 15%;
    background-image: linear-gradient(75deg,rgba(250,171,83,0.7), rgba(0,57,116,1),rgba(250,171,83,0.7));
}

table, th, td {
    border: 1px ridge white;
    border-collapse: collapse;
}
th, td {
    background-color: rgb(220,220,220);
    
}
td{
    padding: 2%;
}

#page2 ,thead{
    padding: none;
}
.more{
    margin-left: 97%;
    font-weight: bold;
}
.back{
    font-weight: bold;
}

        </style>
         <script>
        function submitForm() {
            //alert("*************");
            document.forms[0].action="/LTP/CommercialAgreementsServlet";
            document.forms[0].method="GET";
            document.forms[0].submit();
           };
        
    </script>
    
        <link rel="stylesheet" href="main-page.css">
        <div class="heading">
            <h1>GHIAL Legal Agreements Tracking System</h1>
        <div class="header">
        <div class="contents">
            <a href="CommercialContract.jsp" style="color:rgb(0, 0, 0);">New Commercial Contract</a>
        </div>
        <div class="contents">
            <a href="ServiceContract.jsp" style="color:rgb(0, 0, 0);">New Service contact</a>
        </div>
        <div class="contents">
           <a href="CommercialAgreements.jsp" style="color:rgb(0, 0, 0);">Commercial Agreements List</a> 
            <!--<a href="#" onclick="javascript:submitForm();" style="color:rgb(0, 0, 0);">Commercial Agreements List</a>-->
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
        <form></form>        <div id="fixed">
        <h2>THE FOLLOWING COMMERCIAL AGREEMENTS ARE IN OPEN STATE</h2>
        <div class="content">
        <label for="search"></label>
        <input type="search" id="search" name="search"value="Search...."><br><br><br>
        <input type="submit" id="excel" name="excel" value="Excel">
        </div>
        </div><br><br><br>
        
        <div id="page1">
            <table border="1">
                <button class="more" onclick="showPage2()">More</button>
                <thead>
                <tr>
                    <th>AGREEMENT ID</th>
                    <th>AGREEMENT NO</th>
                    <th>AGREEMENT SUBJECT</th>
                    <th>AGREEMENT SCOPE</th>
                    <th>NATURE OF AGREEMENT</th>
                    <th>AGREEMENT TYPE</th>
                    <th>NAME OF THE PARTY</th>
                    <th>DATE OF EXECUTION</th>
                    <th>COMMENCEMENT DATE</th>
                    <th>EXPIRY DATE</th>
                    <th>DEPARTMENT</th>
                    <th>RECIPIENT1</th>
                    
                </tr>
                </thead>
                <tbody>
                    <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                   
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                   
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    
                </tr>
                </tbody>
            </table>
            
        </div>
        
        <div id="page2" class="hidden">
            
            <table border="1">
                <button class="back" onclick="showPage1()">Back</button>
              <thead>
                <tr>
                    <th>RECEPIENT2</th>
                    <th>RECEPIENT3</th>
                    <th>RECEPIENT 4</th>
                    <th>RECEPIENT 5</th>
                    <th>RECEPIENT 6</th>
                    <th>MODIFIED BY</th>
                    <th>LOCATION</th>
                    <th>SECURITY DEPOSITS</th>
                    <th>UPLOAD 1</th>
                    <th>UPLOAD 2</th>
                    <th>UPLOAD 3</th>
                    <th>UPLOAD 4</th>
                    <th>UPLOAD 5</th>
                    <th>REMARKS</th>
                    <th>STATUS</th>
                    <th>AGGREMENTS STATUS</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    
                </tr>
              </tbody>
            </table>
            
          </div>
          
          <script>
            function showPage2() {
              document.getElementById("page1").classList.add("hidden");
              document.getElementById("page2").classList.remove("hidden");
            }
          
            function showPage1() {
              document.getElementById("page2").classList.add("hidden");
              document.getElementById("page1").classList.remove("hidden");
            }
          </script>
          
          </body>
          </html>
          



