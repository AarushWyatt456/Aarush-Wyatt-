<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', sans-serif;
        }
        .dashboard-container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
        }
        .card {
            border: none;
            transition: transform 0.3s ease;
            height: 100%;
        }
        .card:hover {
            transform: scale(1.03);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .icon-circle {
            width: 60px;
            height: 60px;
            background-color: #007bff;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin: 0 auto 15px;
        }
        .logout-btn {
            position: absolute;
            top: 20px;
            right: 20px;
        }
        .welcome-message {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

<div class="container dashboard-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Admin Dashboard</h2>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger logout-btn">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>

    <c:if test="${not empty user}">
        <div class="welcome-message alert alert-info">
            Welcome back, <strong>${user.email}</strong> (Admin)
        </div>
    </c:if>

    <div class="row g-4">
        <!-- Add Doctor Card -->
        <div class="col-md-4">
            <a href="${pageContext.request.contextPath}/admin/add-doctor" class="text-decoration-none text-dark">
                <div class="card p-4 text-center shadow-sm">
                    <div class="icon-circle bg-primary">
                        <i class="bi bi-person-plus-fill"></i>
                    </div>
                    <h5>Add Doctor</h5>
                    <p class="text-muted">Register new doctors to the system</p>
                </div>
            </a>
        </div>

        <!-- View Doctors Card -->
        <div class="col-md-4">
            <a href="${pageContext.request.contextPath}/admin/view-doctors" class="text-decoration-none text-dark">
                <div class="card p-4 text-center shadow-sm">
                    <div class="icon-circle bg-success">
                        <i class="bi bi-person-lines-fill"></i>
                    </div>
                    <h5>View Doctors</h5>
                    <p class="text-muted">Manage all doctor profiles</p>
                </div>
            </a>
        </div>

        <!-- View Patients Card -->
        <div class="col-md-4">
            <a href="${pageContext.request.contextPath}/admin/patient-form" class="text-decoration-none text-dark">
                <div class="card p-4 text-center shadow-sm">
                    <div class="icon-circle bg-warning">
                        <i class="bi bi-people-fill"></i>
                    </div>
                    <h5>View Patients</h5>
                    <p class="text-muted">Access patient records</p>
                </div>
            </a>
        </div>

        <!-- All Users Card -->
        <div class="col-md-4">
            <a href="${pageContext.request.contextPath}/admin/all-users" class="text-decoration-none text-dark">
                <div class="card p-4 text-center shadow-sm">
                    <div class="icon-circle bg-secondary">
                        <i class="bi bi-list-ul"></i>
                    </div>
                    <h5>All Users</h5>
                    <p class="text-muted">Manage all system users</p>
                </div>
            </a>
        </div>

        <!-- Reports Card -->
        <div class="col-md-4">
            <a href="${pageContext.request.contextPath}/admin/reports" class="text-decoration-none text-dark">
                <div class="card p-4 text-center shadow-sm">
                    <div class="icon-circle bg-info">
                        <i class="bi bi-file-earmark-text"></i>
                    </div>
                    <h5>Reports</h5>
                    <p class="text-muted">Generate system reports</p>
                </div>
            </a>
        </div>

        <!-- System Settings Card (Example additional feature) -->
        <div class="col-md-4">
            <a href="#" class="text-decoration-none text-dark">
                <div class="card p-4 text-center shadow-sm">
                    <div class="icon-circle bg-dark">
                        <i class="bi bi-gear-fill"></i>
                    </div>
                    <h5>System Settings</h5>
                    <p class="text-muted">Configure system parameters</p>
                </div>
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>