<%-- 
    Document   : EditPage
    Created on : 14 Jun, 2024, 9:36:06 AM
    Author     : navya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, db.DBParameters" %>
<!DOCTYPE html>
<html>
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
        .heading {
            background-image: linear-gradient(75deg, rgba(0,57,116,0.3), rgba(0,57,116,0.3),rgba(0,57,116,0.3),rgba(0,57,116,0.3));
            position: relative;
            top: -30px;
            background-size: cover;
        }
        a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: none;}
        .header {
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
    overflow: auto; /* Add this to allow scrolling if necessary */        }
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
            border-radius: 10%;
        }*/
        .container {
            color: white;
            font-size: medium;
            width: 50px;
            margin-left: 750px;
            border-radius: 15%;
            background-image: linear-gradient(75deg,rgba(250,171,83,0.7), rgba(0,57,116,1),rgba(250,171,83,0.7));
        }
/*        th{
        background-color: #003974;
        border: 1px ridge black;
        border-collapse: collapse;
        color:white;
        
        }
        table,  td {
            border: 1px ridge black;
            border-collapse: collapse;
            
        }
         td {
            background-color: white;
            
        }*/
        
        .button {
            color: white;
            -webkit-text-stroke: 1px white;
            
            width: 160px;
            margin-left:120px;
            border-radius: 20px;;
            background-image: linear-gradient(75deg,rgba(250,171,83,0.7), rgba(0,57,116,1),rgba(250,171,83,0.7));
        }
        button{
            background-color: #faab53;
            padding:6px;
        }
        .input{
            color: black;
            font-size: medium;
            width: 340px;
            margin-left: 640px;
            border-radius: 15%;
            background-color: white;
        }
        .form{
              width: 30%;
    padding: 1%;
    font-size:medium;
    font-family:Georgia;
    background-image: linear-gradient(75deg,rgba(250,171,83,0.7), rgba(0,57,116,1),rgba(250,171,83,0.7));
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-left: 35%;
/*    font-size:20px;*/
        }
        .form input {
    width: 150px;
    padding: 5px;
    border: 1px solid black;
    border-radius: 5px;
    font-size: small;
    box-indent: 10px;
}
 .form-container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            border-radius: 10px;
            max-width: 300px;
            margin: auto;
        }

        .form-group {
            display: flex;
            justify-content: space-between;
           
            margin-bottom: 10px;
        }

        .form-group label {
            
            text-align: right;
            padding-right: 10px;
        }

        .form-group input {
            
            text-indent: 10px; /* Indent text inside input */
        }
/**input[type=text]  {

 margin-left:90px;
  
}**/
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
        <h3>Edit Page</h3>
        
<%
    String agreementNo = request.getParameter("agreementNo");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName(DBParameters.JDBC_DRIVER);
        conn = DriverManager.getConnection(DBParameters.URL, DBParameters.USER, DBParameters.PASSWORD);
        stmt = conn.createStatement();
        String sql = "SELECT * FROM Agreements WHERE agreementNo = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, agreementNo);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // Retrieve the data
            
            String partyName = rs.getString("partyName");
            String commencementType = rs.getString("commencementType");
            String commencementDate = rs.getString("commencementDate");
            System.out.println("commencementDtae:"+commencementDate);
            String recipient1 = rs.getString("recipient1");
            String recipient2 = rs.getString("recipient2");
            String recipient3 = rs.getString("recipient3");
            String recipient4 = rs.getString("recipient4");
            String recipient5 = rs.getString("recipient5");
            String recipient6 = rs.getString("recipient6");
            String modifiedBy = rs.getString("modifiedBy");
           
            String agreementStatus=rs.getString("agreementStatus");

            // Display the form with the data
%>
            <form id="myForm" class="form" action="UpdateAgreementServlet" method="post">
    <input type="hidden" name="agreementNo" value="<%= agreementNo %>">
    <div class="form-group">
       <label for="agreementNo">Agreement No:</label>
        <input type="text" name="agreementNo" value="<%= agreementNo %>" readonly>
         
    </div>
    <div class="form-group">
        <label for="partyName">Party Name:</label>
        <input type="text" name="partyName" value="<%= partyName %>">
    </div>
     <div class="form-group">
        <label for="commencementType">Commencement Type:</label>
        <input type="text" name="commencementType" value="<%= commencementType %>">
    </div>
    <div class="form-group">
        <label for="commencementDate">Commencement Date:</label>
        <input type="date" name="commencementDate" value="<%= commencementDate %>">
    </div>
    <div class="form-group">
        <label for="recipient1">Recipient 1:</label>
        <input type="text" name="recipient1" value="<%= recipient1 %>">
    </div>
    <div class="form-group">
        <label for="recipient2">Recipient 2:</label>
        <input type="text" name="recipient2" value="<%= recipient2 %>">
    </div>
    <div class="form-group">
        <label for="recipient3">Recipient 3:</label>
        <input type="text" name="recipient3" value="<%= recipient3 %>">
    </div>
    <div class="form-group">
        <label for="recipient4">Recipient 4:</label>
        <input type="text" name="recipient4" value="<%= recipient4 %>">
    </div>
    <div class="form-group">
        <label for="recipient5">Recipient 5:</label>
        <input type="text" name="recipient5" value="<%= recipient5 %>">
    </div>
    <div class="form-group">
        <label for="recipient6">Recipient 6:</label>
        <input type="text" name="recipient6" value="<%= recipient6 %>">
    </div>

    <div class="form-group">
        <label for="agreementStatus">Agreement Status:</label>
        <input type="text" name="agreementStatus" value="<%= agreementStatus %>">
    </div>
    <input class="button" type="submit" value="Update">
</form>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

    </body>
</html>
