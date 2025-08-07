<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Raj Stock - Manage Stocks</title>
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- AOS CSS for animations -->
    <link href="${pageContext.request.contextPath}/static/fontawesome/css/aos.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="${pageContext.request.contextPath}/static/fontawesome/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/static/css/stocks.css" rel="stylesheet">
    <!-- Footer CSS -->
    <link href="${pageContext.request.contextPath}/static/css/footer.css" rel="stylesheet">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar" aria-label="Main navigation" data-aos="fade-right">
        <div class="row" style="margin-left: 5%;width: 75%; margin-top: -16px;"><img src="${pageContext.request.contextPath}/static/images/logo.png" alt="Real-Time Data"></div>
        <a href="${pageContext.request.contextPath}/dashboard" aria-label="Dashboard" data-aos="fade-right" data-aos-delay="200"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/stocks" aria-label="Manage Stocks" class="active" data-aos="fade-right" data-aos-delay="300"><i class="fas fa-chart-line"></i> Manage Stocks</a>
        <a href="${pageContext.request.contextPath}/portfolio" aria-label="Portfolio" data-aos="fade-right" data-aos-delay="400"><i class="fas fa-briefcase"></i> Portfolio</a>
        <a href="${pageContext.request.contextPath}/logout" aria-label="Logout" data-aos="fade-right" data-aos-delay="500"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Toggle Button for Mobile -->
    <button class="btn btn-primary toggle-btn" onclick="toggleSidebar()" aria-label="Toggle sidebar"><i class="fas fa-bars"></i></button>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header" data-aos="fade-down">
            <h1>Manage Stocks</h1>
            <p>Add, edit, or view your stock holdings </p>
        </div>

        <!-- Stock List and Form Section -->
        <section class="stock-manage-section" aria-label="Manage stocks">
            <div class="container">
                <div class="row">
                    <!-- Stock Table -->
                    <div class="col-md-8" data-aos="fade-up" data-aos-delay="100">
                        <h2>Stock List</h2>
                        <div class="stock-table">
                            <table class="table table-striped table-hover" aria-label="Stock list table">
                                <thead>
                                    <tr>
                                        <th scope="col">Symbol</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Current Price</th>
                                        <th scope="col">Change (%)</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="stock" items="${page.content}">
                                        <tr>
                                            <td>${stock.symbol}</td>
                                            <td>${stock.name}</td>
                                            <td>$<c:out value="${String.format('%.2f', stock.currentPrice)}"/></td>
                                            <td>
                                                <span class="${stock.changePercent >= 0 ? 'text-success' : 'text-danger'}">
                                                    <c:out value="${String.format('%.2f', stock.changePercent)}"/>%
                                                </span>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/stocks/edit/${stock.id}" class="btn btn-sm btn-primary" aria-label="Edit stock ${stock.symbol}"><i class="fas fa-edit"></i></a>
                                                <a href="${pageContext.request.contextPath}/stocks/delete/${stock.id}" class="btn btn-sm btn-danger" aria-label="Delete stock ${stock.id}" onclick="return confirm('Are you sure you want to delete ${stock.symbol}?');"><i class="fas fa-trash"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination -->
                        <nav aria-label="Stock list pagination" data-aos="fade-up" data-aos-delay="200">
                            <ul class="pagination justify-content-center">
                                <!-- Previous Button -->
                                <li class="page-item ${page.first ? 'disabled' : ''}">
                                    <a class="page-link" href="${pageContext.request.contextPath}/stocks?page=${page.number - 1}&size=${page.size}" aria-label="Previous page">
                                        <span aria-hidden="true">«</span>
                                    </a>
                                </li>
                                <!-- Page Numbers -->
                                <c:forEach begin="0" end="${page.totalPages - 1}" var="i">
                                    <li class="page-item ${page.number == i ? 'active' : ''}">
                                        <a class="page-link" href="${pageContext.request.contextPath}/stocks?page=${i}&size=${page.size}">${i + 1}</a>
                                    </li>
                                </c:forEach>
                                <!-- Next Button -->
                                <li class="page-item ${page.last ? 'disabled' : ''}">
                                    <a class="page-link" href="${pageContext.request.contextPath}/stocks?page=${page.number + 1}&size=${page.size}" aria-label="Next page">
                                        <span aria-hidden="true">»</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>

                    <!-- Add/Edit Stock Form -->
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                        <h2>${stock != null ? 'Edit Stock' : 'Add Stock'}</h2>
                        <div class="stock-form">
                            <c:if test="${not empty successMessage}">
                                <div class="success-message">${successMessage}</div>
                            </c:if>
                            <c:if test="${not empty errorMessage}">
                                <div class="error-message">${errorMessage}</div>
                            </c:if>
                            <form action="${pageContext.request.contextPath}/stocks/${stock != null ? 'update' : 'add'}" method="post" aria-label="${stock != null ? 'Edit stock form' : 'Add stock form'}">
                                <c:if test="${stock != null}">
                                    <input type="hidden" name="id" value="${stock.id}">
                                </c:if>
                                <div class="mb-3">
                                    <label for="symbol" class="form-label">Symbol</label>
                                    <input type="text" class="form-control" id="symbol" name="symbol" placeholder="e.g., AAPL" value="${stock != null ? stock.symbol : ''}" required aria-describedby="symbolHelp">
                                    <div id="symbolHelp" class="form-text">Enter the stock ticker symbol.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="e.g., Apple Inc." value="${stock != null ? stock.name : ''}" required aria-describedby="nameHelp">
                                    <div id="nameHelp" class="form-text">Enter the company name.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="currentPrice" class="form-label">Current Price</label>
                                    <input type="number" step="0.01" class="form-control" id="currentPrice" name="currentPrice" placeholder="e.g., 150.00" value="${stock != null ? String.format('%.2f', stock.currentPrice) : ''}" required aria-describedby="currentPriceHelp">
                                    <div id="currentPriceHelp" class="form-text">Enter the current stock price.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="changePercent" class="form-label">Change (%)</label>
                                    <input type="number" step="0.01" class="form-control" id="changePercent" name="changePercent" placeholder="e.g., 2.50" value="${stock != null ? String.format('%.2f', stock.changePercent) : ''}" required aria-describedby="changePercentHelp">
                                    <div id="changePercentHelp" class="form-text">Enter the percentage change.</div>
                                </div>
                                <button type="submit" class="btn btn-primary" aria-label="${stock != null ? 'Update stock' : 'Add stock'}">${stock != null ? 'Update' : 'Add'} Stock</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/footer.jsp" %>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
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