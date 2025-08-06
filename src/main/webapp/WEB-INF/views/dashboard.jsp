<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Raj Stock- Dashboard</title>
     <script src="${pageContext.request.contextPath}/static/js/aos.js"></script> 
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
   <!-- Font Awesome for Icons -->
    <link href="/static/fontawesome/css/all.min.css" rel="stylesheet">
    <!-- Chart.js -->
    <script src="${pageContext.request.contextPath}/static/js/chart.umd.min.js"></script>
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/static/css/footer.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to bottom, #e9ecef, #f4f7fa);
            margin: 0;
            overflow-x: hidden;
        }
        /* Sidebar */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 260px;
            background: linear-gradient(180deg, #1e3a8a 0%, #1e40af 100%);
            color: white;
            padding-top: 30px;
            transition: transform 0.3s ease;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        .sidebar h2 {
            font-size: 1.8rem;
            text-align: center;
            margin-bottom: 40px;
            font-weight: 700;
        }
        .sidebar a {
            color: #e5e7eb;
            display: flex;
            align-items: center;
            padding: 15px 25px;
            text-decoration: none;
            transition: background-color 0.3s, padding-left 0.3s;
        }
        .sidebar a i {
            margin-right: 10px;
        }
        .sidebar a:hover {
            background-color: #22d3ee;
            color: #1e3a8a;
            padding-left: 30px;
        }
        /* Main Content */
        .main-content {
            margin-left: 260px;
            padding: 30px;
            min-height: 100vh;
        }
        .header {
            background: linear-gradient(135deg, #1e3a8a 0%, #22d3ee 100%);
            color: white;
            padding: 30px;
            border-radius: 15px;
            margin-bottom: 40px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        .header h1 {
            font-size: 2.5rem;
            font-weight: 700;
        }
        .header p {
            font-size: 1.1rem;
        }
        /* Charts Section */
        .charts-section {
            padding: 50px 0;
        }
        .charts-section h2 {
            color: #1e3a8a;
            font-weight: 600;
            margin-bottom: 40px;
            text-align: center;
        }
        .chart-container {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            transition: transform 0.3s;
        }
        .chart-container:hover {
            transform: translateY(-5px);
        }
        /* Reports Section */
        .reports-section {
            padding: 50px 0;
        }
        .reports-section h2 {
            color: #1e3a8a;
            font-weight: 600;
            margin-bottom: 40px;
            text-align: center;
        }
        .report-table {
            background: white;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .report-table th {
            background-color: #1e3a8a;
            color: white;
            font-weight: 600;
        }
        .report-table td {
            vertical-align: middle;
        }
        .report-table .btn {
            transition: background-color 0.3s, transform 0.3s;
        }
        .report-table .btn:hover {
            transform: scale(1.05);
        }
        /* Portfolio Summary */
        .portfolio-summary {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .portfolio-summary h3 {
            color: #1e3a8a;
            font-weight: 600;
            margin-bottom: 20px;
        }
        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-260px);
            }
            .sidebar.active {
                transform: translateX(0);
                z-index: 1000;
            }
            .main-content {
                margin-left: 0;
            }
            .toggle-btn {
                display: block;
                position: fixed;
                top: 15px;
                left: 15px;
                z-index: 1001;
                border-radius: 10px;
            }
            .chart-container {
                min-height: 300px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar" aria-label="Main navigation">
        <div class="row" style="margin-left: 5%;width: 75%; margin-top: -16px;"><img src="${pageContext.request.contextPath}/static/images/logo.png" alt="Real-Time Data"></div>
        <a href="${pageContext.request.contextPath}/dashboard" aria-label="Dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/stocks" aria-label="Manage Stocks"><i class="fas fa-chart-line"></i> Manage Stocks</a>
        <a href="${pageContext.request.contextPath}/portfolio" aria-label="Portfolio"><i class="fas fa-briefcase"></i> Portfolio</a>
        <a href="${pageContext.request.contextPath}/logout" aria-label="Logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Toggle Button for Mobile -->
    <button class="btn btn-primary toggle-btn d-none" onclick="toggleSidebar()" aria-label="Toggle sidebar"><i class="fas fa-bars"></i></button>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header" data-aos="fade-down">
            <h1>Raj Stock Dashboard</h1>
            <p>Track your investments, analyze market trends, and optimize your portfolio.</p>
            <p>Token : ${JwtToken} </p>
        </div>

        <!-- Portfolio Summary -->
        <section class="portfolio-summary" data-aos="fade-up" aria-label="Portfolio summary">
            <div class="container">
                <h3>Portfolio Overview</h3>
                <div class="row">
                    <div class="col-md-3">
                        <p><strong>Total Value:</strong> $25,430.50</p>
                    </div>
                    <div class="col-md-3">
                        <p><strong>Day Change:</strong> <span class="text-success">+1.75%</span></p>
                    </div>
                    <div class="col-md-3">
                        <p><strong>Total Gain:</strong> <span class="text-success">+$3,200.10</span></p>
                    </div>
                    <div class="col-md-3">
                        <p><strong>Stocks Owned:</strong> 12</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Charts Section -->
        <section class="charts-section" aria-label="Market and portfolio insights">
            <div class="container">
                <h2 data-aos="fade-up">Market & Portfolio Insights</h2>
                <div class="row">
                    <div class="col-md-6" data-aos="zoom-in" data-aos-delay="100">
                        <div class="chart-container" role="img" aria-label="Portfolio Value Over Time Chart">
                            <canvas id="stockChart"></canvas>
                        </div>
                    </div>
                    <div class="col-md-6" data-aos="zoom-in" data-aos-delay="200">
                        <div class="chart-container" role="img" aria-label="Portfolio Allocation by Sector Chart">
                            <canvas id="portfolioChart"></canvas>
                        </div>
                    </div>
                    <div class="col-md-6" data-aos="zoom-in" data-aos-delay="300">
                        <div class="chart-container" role="img" aria-label="Monthly Trading Volume Chart">
                            <canvas id="volumeChart"></canvas>
                        </div>
                    </div>
                    <div class="col-md-6" data-aos="zoom-in" data-aos-delay="400">
                        <div class="chart-container" role="img" aria-label="Sector Performance Chart">
                            <canvas id="sectorChart"></canvas>
                        </div>
                    </div>
                    <div class="col-md-6" data-aos="zoom-in" data-aos-delay="500">
                        <div class="chart-container" role="img" aria-label="AAPL Stock Price Chart">
                            <canvas id="candlestickChart"></canvas>
                        </div>
                    </div>
                    <div class="col-md-6" data-aos="zoom-in" data-aos-delay="600">
                        <div class="chart-container" role="img" aria-label="Portfolio Returns Over Time Chart">
                            <canvas id="returnsChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Reports Section -->
        <section class="reports-section" aria-label="Stock performance report">
            <div class="container">
                <h2 data-aos="fade-up">Stock Performance Report</h2>
                <div class="report-table" data-aos="fade-up" data-aos-delay="100">
                    <table class="table table-striped table-hover" aria-label="Stock performance table">
                        <thead>
                            <tr>
                                <th scope="col">Stock</th>
                                <th scope="col">Price</th>
                                <th scope="col">Change (%)</th>
                                <th scope="col">Volume</th>
                                <th scope="col">Market Cap</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>APPLE</td>
                                <td>$145.32</td>
                                <td class="text-success">+2.45%</td>
                                <td>1.2M</td>
                                <td>$2.4T</td>
                                <td><a href="${pageContext.request.contextPath}/stocks/apple" class="btn btn-sm btn-primary" aria-label="View Apple stock details">View</a></td>
                            </tr>
                            <tr>
                                <td>TESLA</td>
                                <td>$650.10</td>
                                <td class="text-danger">-1.32%</td>
                                <td>3.5M</td>
                                <td>$680B</td>
                                <td><a href="${pageContext.request.contextPath}/stocks/tesla" class="btn btn-sm btn-primary" aria-label="View Tesla stock details">View</a></td>
                            </tr>
                            <tr>
                                <td>AMAZON</td>
                                <td>$3200.75</td>
                                <td class="text-success">+0.89%</td>
                                <td>0.9M</td>
                                <td>$1.6T</td>
                                <td><a href="${pageContext.request.contextPath}/stocks/amazon" class="btn btn-sm btn-primary" aria-label="View Amazon stock details">View</a></td>
                            </tr>
                            <tr>
                                <td>MICROSOFT</td>
                                <td>$280.45</td>
                                <td class="text-success">+1.12%</td>
                                <td>1.5M</td>
                                <td>$2.1T</td>
                                <td><a href="${pageContext.request.contextPath}/stocks/microsoft" class="btn btn-sm btn-primary" aria-label="View Microsoft stock details">View</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
    <!-- AOS JS -->
    <script src="${pageContext.request.contextPath}/static/js/aos.js"></script>
      <!-- Footer -->
    <%@ include file="/WEB-INF/views/footer.jsp" %>
    <!-- Chart.js Script -->
    <script>
        // Initialize AOS with error handling
        try {
            AOS.init({ duration: 800 });
        } catch (e) {
            console.error('AOS initialization failed:', e);
        }

        // Toggle Sidebar for Mobile
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('active');
        }

        // Stock Price Chart (Line)
        const stockChart = new Chart(document.getElementById('stockChart'), {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Portfolio Value ($)',
                    data: [10000, 10500, 10200, 11000, 10800, 11500],
                    borderColor: '#1e3a8a',
                    backgroundColor: 'rgba(30, 58, 138, 0.2)',
                    fill: true,
                    tension: 0.3
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Portfolio Value Over Time', font: { size: 16 } },
                    tooltip: { mode: 'index', intersect: false }
                },
                scales: {
                    y: { beginAtZero: false, title: { display: true, text: 'Value ($)' } }
                },
                interaction: { mode: 'nearest', axis: 'x', intersect: false }
            }
        });

        // Portfolio Allocation Chart (Pie)
        const portfolioChart = new Chart(document.getElementById('portfolioChart'), {
            type: 'pie',
            data: {
                labels: ['Tech', 'Finance', 'Energy', 'Healthcare', 'Consumer'],
                datasets: [{
                    label: 'Portfolio Allocation',
                    data: [40, 25, 15, 10, 10],
                    backgroundColor: ['#22d3ee', '#1e3a8a', '#facc15', '#ef4444', '#10b981'],
                    borderColor: '#fff',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Portfolio Allocation by Sector', font: { size: 16 } }
                }
            }
        });

        // Trading Volume Chart (Bar)
        const volumeChart = new Chart(document.getElementById('volumeChart'), {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Trading Volume (M)',
                    data: [1.2, 1.5, 1.3, 1.8, 1.6, 2.0],
                    backgroundColor: '#22d3ee',
                    borderColor: '#1e3a8a',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Monthly Trading Volume', font: { size: 16 } }
                },
                scales: {
                    y: { beginAtZero: true, title: { display: true, text: 'Volume (M)' } }
                }
            }
        });

        // Sector Performance Chart (Bar)
        const sectorChart = new Chart(document.getElementById('sectorChart'), {
            type: 'bar',
            data: {
                labels: ['Tech', 'Finance', 'Energy', 'Healthcare'],
                datasets: [{
                    label: 'Sector Performance (%)',
                    data: [5.2, 3.1, -0.5, 2.8],
                    backgroundColor: ['#22d3ee', '#1e3a8a', '#facc15', '#ef4444'],
                    borderColor: '#fff',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Sector Performance', font: { size: 16 } }
                },
                scales: {
                    y: { beginAtZero: true, title: { display: true, text: 'Performance (%)' } }
                }
            }
        });

        // Candlestick Chart (Using Line with Custom Styling)
        const candlestickChart = new Chart(document.getElementById('candlestickChart'), {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'AAPL Stock Price',
                    data: [145, 150, 147, 155, 152, 160],
                    borderColor: '#1e3a8a',
                    backgroundColor: 'rgba(30, 58, 138, 0.2)',
                    fill: false,
                    tension: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'AAPL Stock Price (Simplified Candlestick)', font: { size: 16 } }
                },
                scales: {
                    y: { beginAtZero: false, title: { display: true, text: 'Price ($)' } }
                }
            }
        });

        // Portfolio Returns Chart (Line)
        const returnsChart = new Chart(document.getElementById('returnsChart'), {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Portfolio Returns (%)',
                    data: [2.5, 1.8, -0.5, 3.2, 1.0, 4.0],
                    borderColor: '#ef4444',
                    backgroundColor: 'rgba(239, 68, 68, 0.2)',
                    fill: true,
                    tension: 0.3
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Portfolio Returns Over Time', font: { size: 16 } }
                },
                scales: {
                    y: { beginAtZero: false, title: { display: true, text: 'Returns (%)' } }
                }
            }
        });
    </script>
</body>
</html>