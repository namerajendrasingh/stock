<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Raj Stock - Login</title>
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- AOS CSS for animations -->
    <%-- <link href="${pageContext.request.contextPath}/static/css/aos.css" rel="stylesheet"> --%>
    <!-- Font Awesome for Icons -->
    <link href="${pageContext.request.contextPath}/static/fontawesome/css/all.min.css" rel="stylesheet">
    <!-- Footer CSS -->
    <link href="${pageContext.request.contextPath}/static/css/footer.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet">
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
        <div class="login-container" data-aos="fade-up">
            <div class="login-header">
                <div class="row align-items-center">
                    <div class="col-2">
                        <a href="${pageContext.request.contextPath}/" class="home-icon" aria-label="Go to Home"><i class="fa fa-home"></i></a>
                    </div>
                    <div class="col-10">
                        <h2>Login</h2>
                    </div>
                </div>
            </div>
            <c:if test="${not empty successMessage}">
                <div class="success-message">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>
            <form action="${pageContext.request.contextPath}/auth/login" method="post" aria-label="Login form">
                <div class="mb-3" data-aos="fade-up" data-aos-delay="100">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required aria-describedby="usernameHelp">
                </div>
                <div class="mb-3" data-aos="fade-up" data-aos-delay="200">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required aria-describedby="passwordHelp">
                </div>
                <button type="submit" class="btn btn-primary" data-aos="fade-up" data-aos-delay="300" aria-label="Submit login">Login</button>
            </form>
            <div class="text-center mt-3" data-aos="fade-up" data-aos-delay="400">
                <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register</a></p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/footer.jsp" %>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
    <!-- AOS JS -->
    <%-- <script src="${pageContext.request.contextPath}/static/js/aos.js"></script> --%>
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