<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctor Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #e0f2fe;
            margin: 0;
            padding: 40px;
        }

        .details-container {
            max-width: 900px;
            margin: auto;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0,0,0,0.15);
        }

        .doctor-header {
            background: linear-gradient(to right, #2563eb, #3b82f6);
            color: white;
            text-align: center;
            padding: 40px;
        }

        .doctor-header h2 {
            margin: 0;
            font-weight: 800;
            font-size: 32px;
        }

        .doctor-body {
            display: flex;
            flex-wrap: wrap;
            padding: 30px;
        }

        .doctor-image {
            flex: 0 0 300px;
            padding: 20px;
        }

        .doctor-image img {
            width: 100%;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .doctor-info {
            flex: 1;
            padding: 20px;
        }

        .info-row {
            display: flex;
            margin-bottom: 18px;
        }

        .info-label {
            font-weight: 600;
            width: 150px;
            color: #444;
        }

        .info-value {
            color: #222;
        }

        .back-link {
            text-align: center;
            margin: 25px 0 40px;
        }

        .back-link a {
            padding: 10px 30px;
            background: #3b82f6;
            color: white;
            font-weight: 600;
            border-radius: 30px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .back-link a:hover {
            background: #1e40af;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        @media (max-width: 768px) {
            .doctor-body {
                flex-direction: column;
            }

            .doctor-image {
                text-align: center;
            }

            .doctor-image img {
                max-width: 250px;
            }
        }
    </style>
</head>
<body>

<div class="details-container">
    <div class="doctor-header">
        <h2>Dr. ${doctor.name}</h2>
        <p>${doctor.qualification} | ${doctor.specialist}</p>
    </div>

    <div class="doctor-body">
        <div class="doctor-image">
            <c:if test="${not empty doctor.base64Image}">
                <img src="data:image/jpeg;base64,${doctor.base64Image}" alt="Doctor Image"/>
            </c:if>
            <c:if test="${empty doctor.base64Image}">
                <img src="https://via.placeholder.com/300x400?text=No+Image" alt="No Image"/>
            </c:if>
        </div>

        <div class="doctor-info">
            <div class="info-row"><div class="info-label">ID:</div><div class="info-value">${doctor.id}</div></div>
            <div class="info-row"><div class="info-label">Name:</div><div class="info-value">${doctor.name}</div></div>
            <div class="info-row"><div class="info-label">Qualification:</div><div class="info-value">${doctor.qualification}</div></div>
            <div class="info-row"><div class="info-label">Specialization:</div><div class="info-value">${doctor.specialist}</div></div>
            <div class="info-row"><div class="info-label">Salary:</div><div class="info-value">$${doctor.salary}</div></div>
            <div class="info-row"><div class="info-label">Contact:</div><div class="info-value">${doctor.contact}</div></div>
            <div class="info-row"><div class="info-label">Email:</div><div class="info-value">${doctor.email}</div></div>
            <div class="info-row"><div class="info-label">Gender:</div><div class="info-value">${doctor.gender}</div></div>
        </div>
    </div>
</div>

<div class="back-link">
    <a href="${pageContext.request.contextPath}/viewemp">← Back to Doctor List</a>
</div>

</body>
</html>
