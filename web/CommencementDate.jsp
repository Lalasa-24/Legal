<!DOCTYPE html>
<html>

<head>
   
    <title>Dashboard</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="css/commencementDates.css">
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
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()" title="Close Dashboard">    &times;</a>
            <a href="Dashboard.jsp" id="total">Total Agreements</a><br>
            <a href="AgreementTypes.jsp" id="types">Types of Agreements</a><br>
            <a href="ExpiredAgreements.jsp" id="expired">Expired Agreements</a><br>
            <a href="CommencementDate.jsp" id="commencement">Commencement Agreements</a>
        </div>
    </div>
<div id="main">
        <span class="open" style="font-size:25px;cursor:pointer" onclick="openNav()" title="Open Dashboard">&#9776;</span>
</div>
    <h3>Commencement Dates for Commercial & Service Agreements</h3><br>
     <form  class="form1" action="FilteredCommencementDateServlet" method="GET">
        <label class="form" for="executionDate">Execution Date:</label>
        <input type="date" id="executionDate" name="executionDate" required>

        <label class="form" for="expiryDate">Expiry Date:</label>
        <input type="date" id="expiryDate" name="expiryDate" required>

        <label class="form" for="agreementType">Agreement Type:</label>
        <select id="agreementType" name="contractType">
            <option value="commercial">Commercial</option>
            <option value="service">Service</option>
        </select>
        <button class="form" type="submit">Filter</button>
    </form>
  
    <div class="chart-container">
        <canvas id="myChart"></canvas>
    </div>

    <script src="chart.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', (event) => {
            // Fetch data from the servlet
            fetch("CommencementDateServlet")
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Data fetched:', data); // Debugging line to check fetched data

                    // Extract data for the combined chart
                    const commencementTypes = Object.keys(data.commercial);
                    const commercialCounts = Object.values(data.commercial);
                    const serviceCounts = Object.values(data.service);

                    const ctx = document.getElementById('myChart').getContext('2d');
                    ctx.canvas.width = 500;  // Set the width in pixels
                    ctx.canvas.height = 350; // Set the height in pixels
                    new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: commencementTypes,
                            datasets: [
                                {
                                    label: 'Commercial Agreements',
                                    data: commercialCounts,
                                    backgroundColor: 'rgba(250,171,83,0.6)',
                                    borderColor: 'rgba(250,171,83,1)',
                                    borderWidth: 2
                                },
                                {
                                    label: 'Service Agreements',
                                    data: serviceCounts,
                                    backgroundColor: 'rgba(0,57,116,0.6)',
                                    borderColor: 'rgba(0,57,116,1)',
                                    borderWidth: 2
                                }
                            ]
                        },
                        options: {
                            responsive: false,
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
                                        font: { size: 16, weight: 'bold' }
                                    }
                                },
                                x: {
                                    title: {
                                        display: true,
                                        text: 'COMMENCEMENT TYPES',
                                        color: 'rgba(0,57,116,1)',
                                        font: { size: 18, weight: 'bold' }
                                    },
                                    ticks: {
                                        color: 'black',
                                        autoSkip: false,
                                        font: { size: 14, weight: 'bold' },
                                        maxRotation: 0,
                                        minRotation: 0
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
                })
                .catch(error => console.error('Error fetching data:', error));
        });
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
