<%-- 
    Document   : Login_Page
    Created on : 24 Apr, 2024, 12:10:06 PM
    Author     : navya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
    <title>Login Page</title>
    <meta charset="UTF-8" /> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
     integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
     crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="css/login.css">
    
  
</head>
<body class="loginbody">
    <div class="loginheader">
        <h1 class="loginh1">GHIAL Legal Agreements Tracking System</h1><br><br><br>
     <% 
        // Check if error message exists in request attributes
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
        <div style="text-align: center;">
            <p style="color: red; font-size: 20px;"><%= errorMessage %></p>
        </div>
    <% } %>
    <div class="login--container">
        <h3 class="loginh3">LOGIN</h3><br>
        <form action="LoginServlet" method="post">
            <div class="logincontainer">
            <div style="font-size:medium;"
                 class="logininput-group">
                 <label for="username"><i class="fa-solid fa-user"></i> USERNAME</label><br><br>
                 <input type="text" id="username" name="username"><br><br>
            </div>
            <div style="font-size:medium;"
                 class="logininput-group">
                <label for="password"><i class="fa-solid fa-lock"></i> PASSWORD</label><br><br>
                <input type="password" id="password" name="password"><br><br>
            </div><br>
            <div class="logininput-group">
                <button onclick="loginForm()" type="submit">LOGIN</button></a>
            </div>
        </div>
        </form>
    </div>  
    </div>
    </div>
    <script>
        function loginForm() {
            window.location.href = 'CommercialAgreements.jsp'; 
           };
        
    </script>

</body>
</html>
