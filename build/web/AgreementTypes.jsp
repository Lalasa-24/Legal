<!DOCTYPE html>
<html>
<head>
      <meta charset="UTF-8" /> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
     <link rel="stylesheet" type="text/css" href="css/agreementTypes.css"> 
    <title>Agreement Types</title>
    <style>
        .form1 {
    text-align: center; /* Center the buttons */
    margin-top: -1.5%;
}
.chart-container2 {  
    width: 100%;   
    max-width: 65%;   
    margin: 20px auto;     
    padding: 20px;  
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);     
    background-color: #f8f9fa;     
    border-radius: 8px;   
  
}
.chart-container3 {  
    width: 100%;   
    max-width: 65%;   
    margin: 20px auto;     
    padding: 20px;  
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);     
    background-color: #f8f9fa;     
    border-radius: 8px;   
  
}
#myChart {  
    height: 30%;  
    width: 100%;     
}
#myChart1 {  
    height: 30%;  
    width: 100%;     
}
.form{
   background-image: linear-gradient(75deg, rgba(250,171,83,0.9), rgba(250,171,83,0.9));
    color: black;
    border: none;
    padding: 0.2%;
    margin: 5px;
/*    font-weight: bold;*/
    font-size: 14px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}
/*.chart-container1 {  
    width: 100%;  Full width   
    height:100%;
    max-width: 65%;  Max width for the chart   
    max-height:100%;
    margin: 20px auto;  Center the chart with margin   
    padding: 20px;  Add padding around the chart   
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);  Subtle shadow   
    background-color: #f8f9fa;  Light background   
    border-radius: 8px;  Rounded corners   
  
}
#myChart1 {  
    height: 30%;  Set a height   
    width: 100%;  Full width   
}*/


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
    <h3>Different Types of Agreements in Commercial & Service</h3>
     <div id="toggle-buttons" class="toggle" style=" text-align: center; margin-top: -1%;">
        <button class="toggle-button" onclick="showChart('commercial')" style=" background-color: rgba(0, 57, 116, 1); color: white;
                border: none;
    padding: 0.2%;
    margin: 5px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;">Commercial Agreements</button>
        <button class="toggle-button" onclick="showChart('service')" style=" background-color: rgba(0, 57, 116, 1); color: white;
                border: none;
    padding: 0.2%;
    margin: 5px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;">Service Agreements</button>
     </div><br>
   
    <form  class="form1" action="FilteredTypesServlet" method="GET">
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
  
   
    <div class="chart-container2" id="commercial-chart-container">
        <canvas id="myChart" style="max-height:550px;"></canvas>
    </div>
    <div class="chart-container3" id="service-chart-container" style="display: none;">
        <canvas id="myChart2" style="max-height:550px;" ></canvas>
    </div>
    <script>
        function showChart(chartType) {
            const commercialChartContainer = document.getElementById('commercial-chart-container');
            const serviceChartContainer = document.getElementById('service-chart-container');

            if (chartType === 'commercial') {
                commercialChartContainer.style.display = 'block';
                serviceChartContainer.style.display = 'none';
            } else if (chartType === 'service') {
                commercialChartContainer.style.display = 'none';
                serviceChartContainer.style.display = 'block';
            }
        }

        // Fetch data from the servlet
        fetch("ATypesServlet")
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Data fetched:', data);  // Debugging line to check fetched data
                
                // Extract data for the first chart (Commercial Agreements)
                const commercialData = data.commercial;
                const commercialDepartments = Object.keys(commercialData);
                const commercialDepartmentData = commercialDepartments.map(dept => {
                    return {
                        department: dept,
                        types: commercialData[dept]
                    };
                });

                const commercialOverallData = data.overall;
                
                // Prepare data for commercial chart
                const commercialLabels = Array.from(new Set([
                    ...commercialDepartments.flatMap(dept => Object.keys(commercialData[dept])),
                    ...Object.keys(commercialOverallData)
                ]));

                const commercialDepartmentCounts = commercialLabels.map(type => {
                    return commercialDepartments.map(dept => commercialData[dept][type] || 0);
                });

                const commercialOverallCounts = commercialLabels.map(type => commercialOverallData[type].commercial || 0);
                
                const ctx1 = document.getElementById('myChart').getContext('2d');
                ctx1.canvas.width = 750;  // Set the width in pixels
                ctx1.canvas.height = 350; // Set the height in pixels
                new Chart(ctx1, {
                    type: 'bar',
                    data: {
                        labels: commercialLabels,
                        datasets: [
                            {
                                label: 'Department Agreements',
                                data: commercialDepartmentCounts,
                                backgroundColor: 'rgba(0,57,116,0.6)',
                                borderColor: 'rgba(0,57,116,1)',
                                borderWidth: 1
                            },
                            {
                                label: 'Overall Agreements',
                                data: commercialOverallCounts,
                                backgroundColor: 'rgba(250,171,83,0.6)',
                                borderColor: 'rgba(250,171,83,1)',
                                borderWidth: 1
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
                                    font: { size: 16, weight: 'bold' },
                                    stepSize: 1
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'COMMERCIAL AGREEMENT TYPES',
                                    color: 'rgba(0,57,116,1)',
                                    font: { size: 18, weight: 'bold' }
                                },
                                ticks: {
                                    color: 'black',
                                    autoSkip: false,
                                    font: { size: 14, weight: 'bold' },
//                                    maxRotation: 0,
//                                    minRotation: 0
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                display: true,
                                position: 'top'
                            },
                            tooltip: {
                                enabled: true,
                                callbacks: {
                                    label: function(context) {
                                        let label = context.dataset.label || '';
                                        if (label) {
                                            label += ': ';
                                        }
                                        label += context.parsed.y;
                                        return label;
                                    }
                                }
                            }
                        }
                    }
                });

                // Extract data for the second chart (Service Agreements)
                const serviceData = data.service;
                const serviceDepartments = Object.keys(serviceData);
                const serviceDepartmentData = serviceDepartments.map(dept => {
                    return {
                        department: dept,
                        types: serviceData[dept]
                    };
                });

                // Prepare data for service chart
                const serviceLabels = Array.from(new Set([
                    ...serviceDepartments.flatMap(dept => Object.keys(serviceData[dept])),
                    ...Object.keys(commercialOverallData) // Assuming overall data includes service data
                ]));

                const serviceDepartmentCounts = serviceLabels.map(type => {
                    return serviceDepartments.map(dept => serviceData[dept][type] || 0);
                });

                const serviceOverallCounts = serviceLabels.map(type => commercialOverallData[type].service || 0);

                const ctx2 = document.getElementById('myChart2').getContext('2d');
                ctx2.canvas.width = 750;  // Set the width in pixels
                ctx2.canvas.height = 350; // Set the height in pixels

                new Chart(ctx2, {
                    type: 'bar',
                    data: {
                        labels: serviceLabels,
                        datasets: [
                            {
                                label: 'Department Agreements',
                                data: serviceDepartmentCounts,
                                backgroundColor: 'rgba(0,57,116,0.6)',
                                borderColor: 'rgba(0,57,116,1)',
                                borderWidth: 1
                            },
                            {
                                label: 'Overall Agreements',
                                data: serviceOverallCounts,
                                backgroundColor: 'rgba(250,171,83,0.6)',
                                borderColor: 'rgba(250,171,83,1)',
                                borderWidth: 1
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
                                    font: { size: 16, weight: 'bold' },
                                    stepSize: 1
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'SERVICE AGREEMENT TYPES',
                                    color: 'rgba(0,57,116,1)',
                                    font: { size: 18, weight: 'bold' }
                                },
                                ticks: {
                                    color: 'black',
                                    autoSkip: false,
                                    font: { size: 14, weight: 'bold' },
//                                    maxRotation: 0,
//                                    minRotation: 0
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                display: true,
                                position: 'top'
                            },
                            tooltip: {
                                enabled: true,
                                callbacks: {
                                    label: function(context) {
                                        let label = context.dataset.label || '';
                                        if (label) {
                                            label += ': ';
                                        }
                                        label += context.parsed.y;
                                        return label;
                                    }
                                }
                            }
                        }
                    }
                });
            })
            .catch(error => console.error('Error fetching data:', error));
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
