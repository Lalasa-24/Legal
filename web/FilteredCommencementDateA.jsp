<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8" /> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    
    <title>Filtered Agreements</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h3 {
            color: rgba(0, 57, 116, 1);
            font-size: 24px;
            font-weight: bold;
        }
        .chart-container {
            position: relative;
            height: 70%;
            max-height: 70%;
            width: 80vw;
            margin: 0 auto;
             width: 100%;   
    max-width: 65%;   
    margin: 20px auto;     
    padding: 20px;  
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);     
    background-color: #f8f9fa;     
    border-radius: 8px;  
        }
        canvas {
            max-height: 550px;
        }
        body {
    background-image: url("gmr.png");
    width: 100%;
    background-size: cover;
    margin: 0;
}

body::-webkit-scrollbar {
    display: none;
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

h3 {
    color: white;
    text-align: center;
    margin-top: -50px;
}

.heading {
    background-image: linear-gradient(75deg, rgba(0,57,116,0.3), rgba(0,57,116,0.3), rgba(0,57,116,0.3), rgba(0,57,116,0.3));
    position: relative;
    top: -30px;
    background-size: cover;
}

.header {
    display: flex;
    flex-wrap: nowrap;
    justify-content: center;
    gap: 1%;
    position: relative;
    top: -7px;
    margin: 0 0 10px 0;
    overflow: auto;
    font-size: small;
}

.contents {
    display: block;
    border: 1px solid;
    background-image: linear-gradient(75deg, rgba(250,171,83,0.9), rgba(250,171,83,0.9));
    padding: 6px;
    font-size: larger;
    border: none;
    border-radius: 10px;
    box-shadow: 5px 5px 10px rgba(0,0,0,0.15);
}

#total, #types, #expired, #commencement {
    border: 1px solid;
    background-image: linear-gradient(75deg, rgba(250,171,83,0.9), rgba(250,171,83,0.9));
    color: black;
    border-radius: 10px;
    font-size: 16px;
}

#total { margin-top: 0; }
#types { margin-top: 20px; }
#expired { margin-top: 20px; }
#commencement { margin-top: 20px; }
#agreementChart {  
    height: 90%;  
    width: 100%;     
}

.sidebar {
    height: 100%;
    margin-top: 7.5%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-image: linear-gradient(75deg, rgba(0, 57, 116, 0.8), rgba(0, 57, 116, 0.8));
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidebar a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidebar .closebtn {
    cursor: pointer;
    color: white;
    right: 20px;
    font-size: 20px;
    margin-left: 80px;
    margin-top: -60px;
    background: rgba(0, 57, 116, 1);
}

#main {
    padding: 16px;
    margin-top: -55px;
}

@media screen and (max-height: 450px) {
    .sidebar { padding-top: 15px; margin-top: 5px; }
    .sidebar a { font-size: 18px; }
}

.open {
    background: rgba(0, 57, 116, 1);
    padding: 8px;
    color: white;
    margin-left: -15px;
    border-radius: 10px;
}

.filterform{
    width: 50%;
            height: 10%;
            background-image: linear-gradient(75deg, rgba(200,200,200,0.8), rgba(240,240,240,0.8), rgba(220,220,220,0.8));
/*            position: absolute;
            left: 29%;
            right: 50%;*/
/*            padding: 25px 30px;*/
            border-radius: 10px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.15);
            box-align: center;
            margin-left: 25%;
            padding:0.3%;
}
submit {
            background-image: linear-gradient(75deg, rgba(250,171,83,0.7), rgba(0,57,116,1),rgba(250,171,83,0.7));
            width: 30%;
            margin-left: 35%;
            margin-bottom:2%;
            border: none;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
          
            cursor: pointer;
        }
        submit:hover {
            background-image: linear-gradient(75deg, rgba(237,28,16,0.8), rgba(237,28,16,0.7), rgba(237,28,16,0.8));
        }

    </style>
     <script src="chart.js"></script>
</head>
<body>
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
    <div class='sidemenu'>
        <div class="sidebar" id="mySidebar">
             <a href="javascript:void(0)" class="closebtn" onclick="closeNav()" title="Close Dashboard">&times;</a>
            <a href="Dashboard.jsp" id="total">Total Agreements</a><br>
            <a href="AgreementTypes.jsp" id="types">Types of Agreements</a><br>
            <a href="ExpiredAgreements.jsp" id="expired">Expired Agreements</a><br>
            <a href="CommencementDate.jsp" id="commencement">Commencement Agreements</a>
        </div>
    </div>
    <div id="main">
        <span class="open" style="font-size:25px;cursor:pointer" onclick="openNav()" title="Open Dashboard">&#9776;</span>
</div>
    <h3>Filtered Agreements</h3>
    <div class="chart-container">
        <canvas id="agreementChart"></canvas>
    </div>

<!--   <canvas id="agreementChart"></canvas>-->
   


 <script>
        // Fetch the JSON data passed from the Servlet
        const jsonData = '<%= request.getAttribute("filteredData") %>';
        
        // Ensure data is not null or undefined
        if (jsonData) {
            const data = JSON.parse(jsonData);
            console.log('Data fetched:', data);  // Debugging line to check fetched data

            // Extract departments and agreement counts from the parsed JSON
            const departments = Object.keys(data);
            const agreementCounts = Object.values(data);

            // Render the chart using Chart.js
            const ctx = document.getElementById('agreementChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: departments,
                    datasets: [{
                        label: 'Number of Agreements',
                        data: agreementCounts,
                        backgroundColor: 'rgba(250,171,83,0.6)',
                        borderColor: 'rgba(250,171,83,1)',
                        borderWidth: 2
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'NO OF AGREEMENTS',
                                color: 'rgba(0,57,116,1)',
                                font: { size: 18, weight: 'bold' }
                            },
                            ticks: {
                                color: 'black',
                                font: { size: 16, weight: 'bold' },
                                stepSize: 1
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'DEPARTMENTS',
                                color: 'rgba(0,57,116,1)',
                                font: { size: 18, weight: 'bold' }
                            },
                            ticks: {
                                color: 'black',
                                autoSkip: false,
                                font: { size: 14, weight: 'bold' }
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        },
                        tooltip: {
                            enabled: true
                        }
                    }
                }
            });
        } else {
            console.error('No data received for chart rendering.');
        }

        // Sidebar functions
        function openNav() {
            document.getElementById("mySidebar").style.width = "140px";
            document.getElementById("main").style.marginLeft = "140px";
        }

        function closeNav() {
            document.getElementById("mySidebar").style.width = "0";
            document.getElementById("main").style.marginLeft= "0";
        }
    </script>
</body>
</html>