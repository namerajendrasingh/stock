<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stock App - Welcome</title>
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- AOS CSS for animations -->
    <link href="${pageContext.request.contextPath}/static/fontawesome/css/aos.css" rel="stylesheet">
    <!-- Chart.js -->
    <script src="${pageContext.request.contextPath}/static/js/chart.umd.min.js"></script>
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #e9ecef;
            margin: 0;
            overflow-x: hidden;
        }
        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, #1e3a8a 0%, #22d3ee 100%);
            color: white;
            padding: 120px 0;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('${pageContext.request.contextPath}/static/images/market-bg.jpg') no-repeat center/cover;
            opacity: 0.2;
            z-index: 0;
        }
        .hero-section .container {
            position: relative;
            z-index: 1;
        }
        .hero-section h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }
        .hero-section p {
            font-size: 1.3rem;
            margin-bottom: 2.5rem;
        }
        .cta-button {
            padding: 15px 40px;
            font-size: 1.2rem;
            border-radius: 50px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
        /* Features Section */
        .features-section {
            padding: 80px 0;
            background-color: #fff;
        }
        .features-section h2 {
            text-align: center;
            margin-bottom: 50px;
            color: #1e3a8a;
            font-weight: 600;
        }
        .feature-card {
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            background: linear-gradient(145deg, #f8f9fa, #e2e8f0);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .feature-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }
        .feature-card img {
            width: 80px;
            margin-bottom: 20px;
        }
        .feature-card h3 {
            color: #1e3a8a;
            font-size: 1.5rem;
        }
        /* Charts Section */
        .charts-section {
            padding: 80px 0;
            background-color: #f4f7fa;
        }
        .charts-section h2 {
            text-align: center;
            margin-bottom: 50px;
            color: #1e3a8a;
            font-weight: 600;
        }
        .chart-container {
            max-width: 500px;
            margin: 0 auto 40px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        /* Reports Section */
        .reports-section {
            padding: 80px 0;
            background-color: #fff;
        }
        .reports-section h2 {
            text-align: center;
            margin-bottom: 50px;
            color: #1e3a8a;
            font-weight: 600;
        }
        .report-table {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .report-table th {
            background-color: #1e3a8a;
            color: white;
        }
        .report-table td {
            vertical-align: middle;
        }
        /* Footer */
        footer {
            background-color: #1e3a8a;
            color: white;
            padding: 30px 0;
            text-align: center;
        }
        footer a {
            color: #22d3ee;
            text-decoration: none;
            margin: 0 10px;
        }
        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <section class="hero-section" data-aos="fade-up">
        <div class="container">
            <h1>Master the Market with Stock App</h1>
            <p>Unlock real-time insights, manage your portfolio, and make data-driven investment decisions.</p>
            <a href="${pageContext.request.contextPath}/register" class="btn btn-light cta-button">Get Started</a>
            <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light cta-button">Login</a>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features-section">
        <div class="container">
            <h2 data-aos="fade-up">Why Stock App Stands Out</h2>
            <div class="row">
                <div class="col-md-4" data-aos="fade-right" data-aos-delay="100">
                    <div class="feature-card">
                        <img src="${pageContext.request.contextPath}/static/images/realtimedata.png" alt="Real-Time Data" style="height: 58px; width: 60px;">
                        <h3>Real-Time Data</h3>
                        <p>Stay ahead with live stock prices and market trends.</p>
                    </div>
                </div>
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="feature-card">
                        <img src="${pageContext.request.contextPath}/static/images/portfoliomanagement.png" alt="Portfolio Management" style="height: 72px; width: 60px;">
                        <h3>Portfolio Management</h3>
                        <p>Effortlessly track and optimize your investments.</p>
                    </div>
                </div>
                <div class="col-md-4" data-aos="fade-left" data-aos-delay="300">
                    <div class="feature-card">
                        <img src="${pageContext.request.contextPath}/static/images/analytics.png" alt="Advanced Analytics" style="height: 72px; width: 60px;">
                        <h3>Advanced Analytics</h3>
                        <p>Leverage powerful tools for deep market insights.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Charts Section -->
    <section class="charts-section">
        <div class="container">
            <h2 data-aos="fade-up">Market Insights & Analytics</h2>
            <div class="row">
                <div class="col-md-4" data-aos="zoom-in" data-aos-delay="100">
                    <div class="chart-container">
                        <canvas id="stockChart"></canvas>
                    </div>
                </div>
                <div class="col-md-4" data-aos="zoom-in" data-aos-delay="200">
                    <div class="chart-container">
                        <canvas id="portfolioChart"></canvas>
                    </div>
                </div>
                <div class="col-md-4" data-aos="zoom-in" data-aos-delay="300">
                    <div class="chart-container">
                        <canvas id="volumeChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Reports Section -->
    <section class="reports-section">
        <div class="container">
            <h2 data-aos="fade-up">Performance Reports</h2>
            <div class="report-table" data-aos="fade-up" data-aos-delay="100">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Stock</th>
                            <th>Price</th>
                            <th>Change (%)</th>
                            <th>Volume</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>APPLE</td>
                            <td>$145.32</td>
                            <td class="text-success">+2.45%</td>
                            <td>1.2M</td>
                        </tr>
                        <tr>
                            <td>TESLA</td>
                            <td>$650.10</td>
                            <td class="text-danger">-1.32%</td>
                            <td>3.5M</td>
                        </tr>
                        <tr>
                            <td>AMAZON</td>
                            <td>$3200.75</td>
                            <td class="text-success">+0.89%</td>
                            <td>0.9M</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
      <!-- Footer -->
    <%@ include file="/WEB-INF/views/footer.jsp" %>
    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/static/fontawesome/js/bootstrap.bundle.min.js"></script>
    <!-- AOS JS -->
    <script src="${pageContext.request.contextPath}/static/js/aos.js"></script>
    <!-- Chart.js Script -->
    <script>
        // Initialize AOS
        AOS.init({ duration: 1000 });

        // Stock Price Chart (Candlestick)
        const stockChart = new Chart(document.getElementById('stockChart'), {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Stock Price (AAPL)',
                    data: [145, 150, 147, 155, 152, 160],
                    borderColor: '#1e3a8a',
                    backgroundColor: 'rgba(30, 58, 138, 0.2)',
                    fill: true,
                    tension: 0.3
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'AAPL Stock Performance' }
                },
                scales: {
                    y: { beginAtZero: false }
                }
            }
        });

        // Portfolio Allocation Chart (Pie)
        const portfolioChart = new Chart(document.getElementById('portfolioChart'), {
            type: 'pie',
            data: {
                labels: ['Tech', 'Finance', 'Energy', 'Healthcare'],
                datasets: [{
                    label: 'Portfolio Allocation',
                    data: [45, 25, 20, 10],
                    backgroundColor: ['#22d3ee', '#1e3a8a', '#facc15', '#ef4444'],
                    borderColor: '#fff',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Portfolio Allocation' }
                }
            }
        });

        // Trading Volume Chart (Bar)
        const volumeChart = new Chart(document.getElementById('volumeChart'), {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Trading Volume',
                    data: [1.2, 1.5, 1.3, 1.8, 1.6, 2.0],
                    backgroundColor: '#22d3ee',
                    borderColor: '#1e3a8a',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Monthly Trading Volume (M)' }
                },
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });
    </script>
</body>
</html>