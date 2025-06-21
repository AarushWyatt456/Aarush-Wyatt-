<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hospital Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 500px;
            margin: 100px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            background-color: white;
        }
        .role-selector {
            margin-bottom: 20px;
        }
        .role-btn {
            width: 100%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="login-container">
        <h2 class="text-center mb-4">Hospital Management System</h2>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
           <!--  <div class="mb-3">
                <label for="role" class="form-label">I am a:</label>
                <div class="role-selector btn-group" role="group">
                    <input type="radio" class="btn-check" name="role" id="patient" value="patient" autocomplete="off" checked>
                    <label class="btn btn-outline-primary role-btn" for="patient">Patient</label>

                    <input type="radio" class="btn-check" name="role" id="doctor" value="doctor" autocomplete="off">
                    <label class="btn btn-outline-primary role-btn" for="doctor">Doctor</label>

                    <input type="radio" class="btn-check" name="role" id="admin" value="admin" autocomplete="off">
                    <label class="btn btn-outline-primary role-btn" for="admin">Admin</label>
                </div>
            </div> -->

            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>

            <div class="mt-3 text-center">
                <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a></p>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
