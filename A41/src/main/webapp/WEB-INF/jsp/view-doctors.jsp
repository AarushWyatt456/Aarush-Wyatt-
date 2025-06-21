<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Our Doctors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .doctor-card {
            transition: all 0.3s ease;
            margin-bottom: 20px;
        }
        .doctor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .doctor-img {
            height: 250px;
            object-fit: cover;
            width: 100%;
        }
        .page-header {
            background-color: #f8f9fa;
            padding: 20px 0;
            margin-bottom: 30px;
            border-bottom: 1px solid #eee;
        }
        .action-buttons .btn {
            margin-right: 5px;
        }
    </style>
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">HospitalMS</a>
        <div class="navbar-nav">
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/">Home</a>
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/view-doctors">Doctors</a>
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/login">Login</a>
        </div>
    </div>
</nav>

<div class="container">
    <!-- Page Header -->
    <div class="page-header">
        <div class="row">
            <div class="col-md-8">
                <h1><i class="bi bi-heart-pulse"></i> Our Medical Team</h1>
                <p class="lead">Meet our team of experienced healthcare professionals</p>
            </div>
            <div class="col-md-4 text-end">
                <form action="${pageContext.request.contextPath}/search-doctors" method="get" class="mb-3">
                    <div class="input-group">
                        <input type="text" name="query" class="form-control" placeholder="Search doctors...">
                        <button class="btn btn-outline-secondary" type="submit">
                            <i class="bi bi-search"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Success Message -->
    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show">
            ${success}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <!-- Doctors Grid -->
    <div class="row">
        <c:forEach items="${doctors}" var="doctor">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card doctor-card h-100">
                    <!-- Doctor Image -->
                    <c:choose>
                        <c:when test="${not empty doctor.image}">
                            <img src="data:image/jpeg;base64,${doctor.base64Image}" 
                                 class="card-img-top doctor-img" 
                                 alt="Dr. ${doctor.name}">
                        </c:when>
                        <c:otherwise>
                            <div class="doctor-img bg-light d-flex align-items-center justify-content-center">
                                <i class="bi bi-person-circle" style="font-size: 5rem;"></i>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    
                    <!-- Doctor Details -->
                    <div class="card-body">
                        <h4 class="card-title">Dr. ${doctor.name}</h4>
                        <h6 class="text-primary mb-3">${doctor.specialist}</h6>
                        <p class="card-text">
                            <i class="bi bi-award"></i> ${doctor.qualification}<br>
                            <i class="bi bi-telephone"></i> ${doctor.contact}<br>
                            <i class="bi bi-envelope"></i> ${doctor.email}
                        </p>
                    </div>
                    
                    <!-- Action Buttons -->
                    <div class="card-footer bg-transparent action-buttons">
                        <a href="${pageContext.request.contextPath}/doctor/details/${doctor.id}" 
                           class="btn btn-sm btn-outline-primary">
                            <i class="bi bi-eye"></i> View
                        </a>
                        <c:if test="${not empty sessionScope.user && sessionScope.user.role == 'admin'}">
                            <a href="${pageContext.request.contextPath}/admin/edit-doctor/${doctor.id}" 
                               class="btn btn-sm btn-outline-secondary">
                                <i class="bi bi-pencil"></i> Edit
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/delete-doctor/${doctor.id}" 
                               class="btn btn-sm btn-outline-danger"
                               onclick="return confirm('Are you sure you want to delete Dr. ${doctor.name}?')">
                                <i class="bi bi-trash"></i> Delete
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    
    <!-- Add Doctor Button (for admin) -->
    <c:if test="${not empty sessionScope.user && sessionScope.user.role == 'admin'}">
        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/admin/add-doctor" class="btn btn-primary btn-lg">
                <i class="bi bi-plus-circle"></i> Add New Doctor
            </a>
        </div>
    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>