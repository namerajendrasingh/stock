<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Raj Stock - Register</title>
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- AOS CSS for animations -->
    <link href="${pageContext.request.contextPath}/static/fontawesome/css/aos.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="${pageContext.request.contextPath}/static/fontawesome/css/all.min.css" rel="stylesheet">
    <!-- Footer CSS -->
    <link href="${pageContext.request.contextPath}/static/css/footer.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to bottom, #e9ecef, #f4f7fa);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .register-container {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
        }
        .register-header {
            background: linear-gradient(135deg, #1e3a8a 0%, #22d3ee 100%);
            color: white;
            padding: 1.5rem;
            border-radius: 10px 10px 0 0;
            text-align: center;
            margin-bottom: 1.5rem;
        }
        .register-header h2 {
            font-size: 1.8rem;
            font-weight: 700;
            margin: 0;
        }
        .form-label {
            font-weight: 700;
            color: #1e3a8a;
        }
        .form-control {
            border-radius: 8px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-control:focus {
            border-color: #22d3ee;
            box-shadow: 0 0 8px rgba(34, 211, 238, 0.3);
        }
        .btn-primary {
            background: linear-gradient(135deg, #1e3a8a 0%, #22d3ee 100%);
            border: none;
            width: 100%;
            padding: 0.75rem;
            border-radius: 8px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .btn-primary:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .success-message {
            color: #28a745;
            text-align: center;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }
        .error-message {
            color: #dc3545;
            text-align: center;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }
        .text-center a {
            color: #22d3ee;
            text-decoration: none;
            font-weight: 500;
        }
        .text-center a:hover {
            text-decoration: underline;
            color: #1e3a8a;
        }
        .home-icon {
            font-size: 1.5rem;
            color: #1e3a8a;
            transition: color 0.3s;
        }
        .home-icon:hover {
            color: #22d3ee;
        }
        /* Sidebar (hidden by default) */
        .sidebar {
            display: none;
        }
        .toggle-btn {
            display: none;
        }
        /* Ensure footer stays at bottom */
        .footer {
            margin-left: 0;
        }
        /* Responsive Design */
        @media (max-width: 576px) {
            .register-container {
                padding: 1.5rem;
            }
            .register-header h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar (Hidden) -->
    <div class="sidebar" id="sidebar" aria-label="Main navigation">
        <h2>Raj Stock</h2>
        <a href="${pageContext.request.contextPath}/dashboard" aria-label="Dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/stocks" aria-label="Manage Stocks"><i class="fas fa-chart-line"></i> Manage Stocks</a>
        <a href="${pageContext.request.contextPath}/portfolio" aria-label="Portfolio"><i class="fas fa-briefcase"></i> Portfolio</a>
        <a href="${pageContext.request.contextPath}/logout" aria-label="Logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Toggle Button for Mobile (Hidden) -->
    <button class="btn btn-primary toggle-btn d-none" onclick="toggleSidebar()" aria-label="Toggle sidebar"><i class="fas fa-bars"></i></button>

    <!-- Main Content -->
    <div class="main-content">
        <div class="register-container" data-aos="fade-up">
            <div class="register-header">
                <div class="row align-items-center">
                    <div class="col-2">
                        <a href="${pageContext.request.contextPath}/" class="home-icon" aria-label="Go to Home"><i class="fas fa-home"></i></a>
                    </div>
                    <div class="col-10">
                        <h2>Register</h2>
                    </div>
                </div>
            </div>
            <c:if test="${not empty successMessage}">
                <div class="success-message">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>
            <form action="${pageContext.request.contextPath}/auth/register" method="post" aria-label="Register form">
                <div class="mb-3" data-aos="fade-up" data-aos-delay="100">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required aria-describedby="usernameHelp">
                </div>
                <div class="mb-3" data-aos="fade-up" data-aos-delay="200">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required aria-describedby="passwordHelp">
                </div>
                <div class="mb-3" data-aos="fade-up" data-aos-delay="300">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required aria-describedby="emailHelp">
                </div>
                <button type="submit" class="btn btn-primary" data-aos="fade-up" data-aos-delay="400" aria-label="Submit registration">Register</button>
            </form>
            <div class="text-center mt-3" data-aos="fade-up" data-aos-delay="500">
                <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a></p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/footer.jsp" %>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
    <!-- AOS JS -->
    <script src="${pageContext.request.contextPath}/static/js/aos.js"></script>
    <!-- AOS Initialization -->
    <script>
        // Initialize AOS with error handling
        try {
            AOS.init({ duration: 800 });
        } catch (e) {
            console.error('AOS initialization failed:', e);
        }
    </script>
</body>
</html>