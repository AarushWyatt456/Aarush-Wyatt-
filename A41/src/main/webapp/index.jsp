<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hospital Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: white;
            padding: 5rem 0;
            margin-bottom: 3rem;
        }
        .feature-card {
            transition: transform 0.3s;
            height: 100%;
        }
        .feature-card:hover {
            transform: translateY(-10px);
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">HospitalMS</a>
        <div class="navbar-nav ms-auto">
            <a class="btn btn-outline-light me-2" href="${pageContext.request.contextPath}/login">Login</a>
            <a class="btn btn-light" href="${pageContext.request.contextPath}/register">Register</a>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section text-center">
    <div class="container">
        <h1 class="display-4 fw-bold">Welcome to Our Hospital</h1>
        <p class="lead">Quality healthcare for you and your family</p>
        <div class="mt-4">
            <a href="${pageContext.request.contextPath}/appointments/new" class="btn btn-light btn-lg me-2">
                <i class="bi bi-calendar-check"></i> Book Appointment
            </a>
            <a href="${pageContext.request.contextPath}/viewemp" class="btn btn-outline-light btn-lg">
                <i class="bi bi-heart-pulse"></i> Our Doctors
            </a>
        </div>
    </div>
</section>

<!-- Features Section -->
<div class="container mb-5">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card feature-card">
                <div class="card-body text-center">
                    <i class="bi bi-heart-pulse text-primary" style="font-size: 2.5rem;"></i>
                    <h3 class="card-title">Expert Doctors</h3>
                    <p class="card-text">Our team of experienced doctors provides the best medical care.</p>
                    <a href="${pageContext.request.contextPath}/viewemp" class="btn btn-primary">View Doctors</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card">
                <div class="card-body text-center">
                    <i class="bi bi-clock-history text-success" style="font-size: 2.5rem;"></i>
                    <h3 class="card-title">24/7 Service</h3>
                    <p class="card-text">Emergency services available round the clock for your needs.</p>
                    <a href="#" class="btn btn-success">Our Services</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card">
                <div class="card-body text-center">
                    <i class="bi bi-calendar2-check text-info" style="font-size: 2.5rem;"></i>
                    <h3 class="card-title">Easy Appointment</h3>
                    <p class="card-text">Book your appointment online with just a few clicks.</p>
                    <a href="${pageContext.request.contextPath}/appointments/new" class="btn btn-info">Book Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 --%>
 
 
<%--  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hospital Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: white;
            padding: 5rem 0;
            margin-bottom: 3rem;
        }
        .feature-card {
            transition: transform 0.3s;
            height: 100%;
        }
        .feature-card:hover {
            transform: translateY(-10px);
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">HospitalMS</a>
        <div class="navbar-nav ms-auto">
            <!-- FIXED LOGIN LINK (added context path) -->
            <a class="btn btn-outline-light me-2" href="${pageContext.request.contextPath}/login">Login</a>
            <a class="btn btn-light" href="${pageContext.request.contextPath}/register">Register</a>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section text-center">
    <div class="container">
        <h1 class="display-4 fw-bold">Welcome to Our Hospital</h1>
        <p class="lead">Quality healthcare for you and your family</p>
        <div class="mt-4">
            <a href="${pageContext.request.contextPath}/appointments/new" class="btn btn-light btn-lg me-2">
                <i class="bi bi-calendar-check"></i> Book Appointment
            </a>
            <a href="${pageContext.request.contextPath}/viewemp" class="btn btn-outline-light btn-lg">
                <i class="bi bi-heart-pulse"></i> Our Doctors
            </a>
        </div>
    </div>
</section>

<!-- Features Section -->
<div class="container mb-5">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card feature-card">
                <div class="card-body text-center">
                    <i class="bi bi-heart-pulse text-primary" style="font-size: 2.5rem;"></i>
                    <h3 class="card-title">Expert Doctors</h3>
                    <p class="card-text">Our team of experienced doctors provides the best medical care.</p>
                    <a href="${pageContext.request.contextPath}/viewemp" class="btn btn-primary">View Doctors</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card">
                <div class="card-body text-center">
                    <i class="bi bi-clock-history text-success" style="font-size: 2.5rem;"></i>
                    <h3 class="card-title">24/7 Service</h3>
                    <p class="card-text">Emergency services available round the clock for your needs.</p>
                    <a href="#" class="btn btn-success">Our Services</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card">
                <div class="card-body text-center">
                    <i class="bi bi-calendar2-check text-info" style="font-size: 2.5rem;"></i>
                    <h3 class="card-title">Easy Appointment</h3>
                    <p class="card-text">Book your appointment online with just a few clicks.</p>
                    <a href="${pageContext.request.contextPath}/appointments/new" class="btn btn-info">Book Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> --%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hospital Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: white;
            padding: 5rem 0;
            margin-bottom: 3rem;
        }
        .feature-card {
            transition: transform 0.3s;
            height: 100%;
        }
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .navbar {
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">HospitalMS</a>
        <div class="navbar-nav ms-auto">
            <a class="btn btn-outline-light me-2" href="${pageContext.request.contextPath}/login">Login</a>
            <a class="btn btn-light" href="${pageContext.request.contextPath}/register">Register</a>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section text-center">
    <div class="container">
        <h1 class="display-4 fw-bold">Welcome to Our Hospital</h1>
        <p class="lead">Quality healthcare for you and your family</p>
        <div class="mt-4">
            <a href="${pageContext.request.contextPath}/appointments/new" class="btn btn-light btn-lg me-2">
                <i class="bi bi-calendar-check"></i> Book Appointment
            </a>
            <a href="${pageContext.request.contextPath}/viewemp" class="btn btn-outline-light btn-lg">
                <i class="bi bi-heart-pulse"></i> Our Doctors
            </a>
        </div>
    </div>
</section>

<!-- Features Section -->
<div class="container mb-5">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card feature-card">
                <div class="card-body text-center">
                    <i class="bi bi-heart-pulse text-primary" style="font-size: 2.5rem;"></i>
                    <h3 class="card-title">Expert Doctors</h3>
                    <p class="card-text">Our team of experienced doctors provides the best medical care.</p>
                    <a href="${pageContext.request.contextPath}/viewemp" class="btn btn-primary">View Doctors</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card">
                <div class="card-body text-center">
                    <i class="bi bi-clock-history text-success" style="font-size: 2.5rem;"></i>
                    <h3 class="card-title">24/7 Service</h3>
                    <p class="card-text">Emergency services available round the clock for your needs.</p>
                    <a href="#" class="btn btn-success">Our Services</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card">
                <div class="card-body text-center">
                    <i class="bi bi-calendar2-check text-info" style="font-size: 2.5rem;"></i>
                    <h3 class="card-title">Easy Appointment</h3>
                    <p class="card-text">Book your appointment online with just a few clicks.</p>
                    <a href="${pageContext.request.contextPath}/appointments/new" class="btn btn-info">Book Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>