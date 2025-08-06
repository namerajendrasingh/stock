<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Raj Stock - Portfolio</title>
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- AOS CSS for animations -->
<%--     <link href="${pageContext.request.contextPath}/static/css/aos.css" rel="stylesheet"> --%>
    <!-- Font Awesome for Icons -->
    <link href="${pageContext.request.contextPath}/static/fontawesome/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/static/css/portfolio.css" rel="stylesheet">
     <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/static/css/footer.css" rel="stylesheet">
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
            <h1>Your Portfolio</h1>
            <p>View and analyze your investment holdings.</p>
        </div>

        <!-- Portfolio Summary Section -->
        <section class="portfolio-summary-section" aria-label="Portfolio summary">
            <div class="container">
                <h2 data-aos="fade-up">Portfolio Overview</h2>
                <div class="portfolio-summary" data-aos="fade-up" data-aos-delay="100">
                    <div class="row">
                        <div class="col-md-3">
                            <p><strong>Total Value:</strong> $<c:out value="${String.format('%.2f', portfolioSummary.totalValue)}"/></p>
                        </div>
                        <div class="col-md-3">
                            <p><strong>Day Change:</strong> <span class="${portfolioSummary.dayChange >= 0 ? 'text-success' : 'text-danger'}"><c:out value="${String.format('%.2f', portfolioSummary.dayChange)}"/>%</span></p>
                        </div>
                        <div class="col-md-3">
                            <p><strong>Total Gain:</strong> <span class="${portfolioSummary.totalGain >= 0 ? 'text-success' : 'text-danger'}">$<c:out value="${String.format('%.2f', portfolioSummary.totalGain)}"/></span></p>
                        </div>
                        <div class="col-md-3">
                            <p><strong>Stocks Owned:</strong> ${portfolioSummary.stockCount}</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Portfolio Table Section -->
        <section class="portfolio-table-section" aria-label="Portfolio holdings">
            <div class="container">
                <h2 data-aos="fade-up">Your Holdings</h2>
                <div class="portfolio-table" data-aos="fade-up" data-aos-delay="100">
                    <table class="table table-striped table-hover" aria-label="Portfolio holdings table">
                        <thead>
                            <tr>
                                <th scope="col">Symbol</th>
                                <th scope="col">Name</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Purchase Price</th>
                                <th scope="col">Current Price</th>
                                <th scope="col">Current Value</th>
                                <th scope="col">Gain/Loss</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="stock" items="${portfolio}">
                                <tr>
                                    <td>${stock.symbol}</td>
                                    <td>${stock.name}</td>
                                    <td>${stock.quantity}</td>
                                    <td>$<c:out value="${String.format('%.2f', stock.purchasePrice)}"/></td>
                                    <td>$<c:out value="${String.format('%.2f', stock.currentPrice)}"/></td>
                                    <td>$<c:out value="${String.format('%.2f', stock.currentPrice * stock.quantity)}"/></td>
                                    <td>
                                        <span class="${(stock.currentPrice - stock.purchasePrice) * stock.quantity >= 0 ? 'text-success' : 'text-danger'}">
                                            $<c:out value="${String.format('%.2f', (stock.currentPrice - stock.purchasePrice) * stock.quantity)}"/>
                                        </span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
      <!-- Footer -->
    <%@ include file="/WEB-INF/views/footer.jsp" %>
    <!-- AOS JS -->
    <%-- <script src="${pageContext.request.contextPath}/static/js/aos.js"></script> --%>
    <!-- Sidebar Toggle Script -->
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
    </script>
</body>
</html>