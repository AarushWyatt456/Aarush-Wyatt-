<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctor Directory</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            font-weight: 800;
            color: #1e3a8a;
            margin-bottom: 30px;
        }

        .add-link {
            text-align: center;
            margin-bottom: 25px;
        }

        .add-link a {
            text-decoration: none;
            margin: 0 15px;
            font-weight: 600;
            color: #2563eb;
            border: 2px solid #2563eb;
            padding: 8px 20px;
            border-radius: 25px;
            transition: all 0.3s;
        }

        .add-link a:hover {
            background: #2563eb;
            color: white;
        }

        .search-container {
            text-align: center;
            margin-bottom: 30px;
        }

        .search-box {
            padding: 12px 20px;
            width: 50%;
            border: 2px solid #ccc;
            border-radius: 25px;
            font-size: 16px;
            transition: 0.3s;
        }

        .search-box:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 10px rgba(59, 130, 246, 0.3);
        }

        .search-button {
            background: #3b82f6;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 25px;
            margin-left: 10px;
            cursor: pointer;
            font-weight: bold;
        }

        .search-button:hover {
            background: #2563eb;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
            background: #1e40af;
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background: #f9fafb;
        }

        tr:hover {
            background: #e0f2fe;
        }

        img {
            max-width: 80px;
            max-height: 100px;
            border-radius: 8px;
        }

        .action-buttons {
            display: inline-flex;
            gap: 10px;
            flex-wrap: nowrap;
            justify-content: center;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            font-size: 16px;
            border-radius: 50%;
            text-decoration: none;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-edit {
            background-color: #3b82f6;
            color: white;
        }

        .btn-edit:hover {
            background-color: #2563eb;
            transform: scale(1.1);
        }

        .btn-delete {
            background-color: #ef4444;
            color: white;
        }

        .btn-delete:hover {
            background-color: #dc2626;
            transform: scale(1.1);
        }

        .btn-details {
            background-color: #10b981;
            color: white;
        }

        .btn-details:hover {
            background-color: #059669;
            transform: scale(1.1);
        }
    </style>
</head>
<body>

<h2>🩺 Doctor Directory</h2>

<div class="add-link">
    <a href="${pageContext.request.contextPath}/add-doctor">+ Add New Doctor</a>
    <a href="${pageContext.request.contextPath}/index.jsp">🏠 Home</a>
    
</div>

<div class="search-container">
    <form action="${pageContext.request.contextPath}/search-doctors" method="get">
        <input type="text" name="query" class="search-box" placeholder="Search by name or ID..." value="${searchQuery}">
        <button type="submit" class="search-button">Search</button>
    </form>
</div>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Image</th>
        <th>Name</th>
        <th>Qualification</th>
        <th>Specialist</th>
        <th>Salary</th>
        <th>Contact</th>
        <th>Email</th>
        <th>Gender</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="doc" items="${doctors}">
        <tr>
            <td>${doc.id}</td>
            <td>
                <c:if test="${not empty doc.base64Image}">
                    <img src="data:image/jpeg;base64,${doc.base64Image}" alt="Doctor Image"/>
                </c:if>
            </td>
            <td>${doc.name}</td>
            <td>${doc.qualification}</td>
            <td>${doc.specialist}</td>
            <td>$${doc.salary}</td>
            <td>${doc.contact}</td>
            <td>${doc.email}</td>
            <td>${doc.gender}</td>
            <td>
                <div class="action-buttons">
                    <a class="btn btn-edit" href="${pageContext.request.contextPath}/edit-doctor/${doc.id}" title="Edit"><i class="fas fa-edit"></i></a>
                    <a class="btn btn-delete" href="${pageContext.request.contextPath}/delete-doctor/${doc.id}" onclick="return confirm('Are you sure you want to delete this doctor?')" title="Delete"><i class="fas fa-trash"></i></a>
                    <a class="btn btn-details" href="${pageContext.request.contextPath}/doctor-details/${doc.id}" title="Details"><i class="fas fa-info-circle"></i></a>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html> --%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Doctor Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-blue: #1e3a8a;
            --hover-blue: #1d4ed8;
            --danger-red: #dc2626;
            --success-green: #16a34a;
        }
        
        body {
            font-family: 'Segoe UI', system-ui, sans-serif;
            background-color: #f8fafc;
            color: #1e293b;
        }
        
        .admin-header {
            background-color: var(--primary-blue);
            color: white;
            padding: 1.5rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .card:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px rgba(0,0,0,0.1);
        }
        
        .doctor-img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
            border: 2px solid #e2e8f0;
        }
        
        .action-btn {
            width: 36px;
            height: 36px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin: 0 3px;
            transition: all 0.2s;
        }
        
        .btn-edit {
            background-color: var(--primary-blue);
            color: white;
        }
        
        .btn-edit:hover {
            background-color: var(--hover-blue);
            transform: scale(1.1);
        }
        
        .btn-delete {
            background-color: var(--danger-red);
            color: white;
        }
        
        .btn-delete:hover {
            background-color: #b91c1c;
            transform: scale(1.1);
        }
        
        .btn-details {
            background-color: var(--success-green);
            color: white;
        }
        
        .btn-details:hover {
            background-color: #15803d;
            transform: scale(1.1);
        }
        
        .search-box {
            border-radius: 50px;
            padding-left: 1.5rem;
            border: 2px solid #cbd5e1;
        }
        
        .search-box:focus {
            border-color: var(--primary-blue);
            box-shadow: 0 0 0 0.25rem rgba(30, 58, 138, 0.25);
        }
        
        .table-responsive {
            border-radius: 12px;
            overflow: hidden;
        }
        
        .table thead {
            background-color: var(--primary-blue);
            color: white;
        }
        
        .table tbody tr:nth-child(even) {
            background-color: #f8fafc;
        }
        
        .table tbody tr:hover {
            background-color: #f1f5f9;
        }
    </style>
</head>
<body>

<!-- Admin Header -->
<div class="admin-header">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2 class="mb-0">
                <i class="fas fa-user-md me-2"></i>Doctor Management
            </h2>
            <div>
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-light me-2">
                    <i class="fas fa-tachometer-alt me-1"></i> Dashboard
                </a>
                <a href="${pageContext.request.contextPath}/admin/add-doctor" class="btn btn-outline-light">
                    <i class="fas fa-plus-circle me-1"></i> Add Doctor
                </a>
            </div>
        </div>
    </div>
</div>

<div class="container mb-5">
    <!-- Success Message -->
    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show">
            <i class="fas fa-check-circle me-2"></i> ${success}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
    
    <!-- Search Box -->
    <div class="card mb-4">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/admin/search-doctors" method="get" class="row g-3">
                <div class="col-md-8">
                    <input type="text" name="query" class="form-control search-box" 
                           placeholder="Search by name, specialty, or ID..." value="${searchQuery}">
                </div>
                <div class="col-md-4">
                    <button type="submit" class="btn btn-primary w-100">
                        <i class="fas fa-search me-2"></i> Search
                    </button>
                </div>
            </form>
        </div>
    </div>
    
    <!-- Doctors Table -->
    <div class="card">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Qualification</th>
                            <th>Specialty</th>
                            <th>Salary</th>
                            <th>Contact</th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="doc" items="${doctors}">
                            <tr>
                                <td>${doc.id}</td>
                                <td>
                                    <c:if test="${not empty doc.base64Image}">
                                        <img src="data:image/jpeg;base64,${doc.base64Image}" 
                                             class="doctor-img" 
                                             alt="Dr. ${doc.name}">
                                    </c:if>
                                    <c:if test="${empty doc.base64Image}">
                                        <div class="doctor-img bg-light d-flex align-items-center justify-content-center">
                                            <i class="fas fa-user-md text-secondary"></i>
                                        </div>
                                    </c:if>
                                </td>
                                <td>Dr. ${doc.name}</td>
                                <td>${doc.qualification}</td>
                                <td><span class="badge bg-primary">${doc.specialist}</span></td>
                                <td>$${doc.salary}</td>
                                <td>${doc.contact}</td>
                                <td>${doc.email}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${doc.gender eq 'Male'}">
                                            <span class="badge bg-info">${doc.gender}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-pink">${doc.gender}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div class="d-flex justify-content-center">
                                        <a href="${pageContext.request.contextPath}/admin/edit-doctor/${doc.id}" 
                                           class="action-btn btn-edit" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/delete-doctor/${doc.id}" 
                                           class="action-btn btn-delete" 
                                           onclick="return confirm('Are you sure you want to delete Dr. ${doc.name}?')"
                                           title="Delete">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/doctor-details/${doc.id}" 
                                           class="action-btn btn-details" title="Details">
                                            <i class="fas fa-info-circle"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Confirm before deleting
    document.querySelectorAll('.btn-delete').forEach(btn => {
        btn.addEventListener('click', (e) => {
            if (!confirm('Are you sure you want to delete this doctor?')) {
                e.preventDefault();
            }
        });
    });
</script>
</body>
</html>